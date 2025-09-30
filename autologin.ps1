Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

# === Konfigurasi Awal (bisa diubah via GUI) ===
$Config = @{
    LoginUrl      = "http://itbi.net/login"
    Username      = "itbi"
    Password      = "123"
    TargetWebsite = "www.google.com"
    LoopDelay     = 30
}

# === Buat Form Utama ===
$form = New-Object System.Windows.Forms.Form
$form.Text = "Auto-Login Hotspot (by Mr.exe)"
$form.Size = New-Object System.Drawing.Size(500, 400)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedDialog"
$form.MaximizeBox = $false

# === Komponen GUI ===
$labelStatus = New-Object System.Windows.Forms.Label
$labelStatus.Location = New-Object System.Drawing.Point(20, 20)
$labelStatus.Size = New-Object System.Drawing.Size(450, 25)
$labelStatus.Text = "Status: Menunggu..."

$textBoxLog = New-Object System.Windows.Forms.TextBox
$textBoxLog.Location = New-Object System.Drawing.Point(20, 50)
$textBoxLog.Size = New-Object System.Drawing.Size(450, 200)
$textBoxLog.Multiline = $true
$textBoxLog.ScrollBars = "Vertical"
$textBoxLog.ReadOnly = $true

$btnCheck = New-Object System.Windows.Forms.Button
$btnCheck.Location = New-Object System.Drawing.Point(20, 260)
$btnCheck.Size = New-Object System.Drawing.Size(120, 30)
$btnCheck.Text = "Cek Koneksi"

$btnLogin = New-Object System.Windows.Forms.Button
$btnLogin.Location = New-Object System.Drawing.Point(160, 260)
$btnLogin.Size = New-Object System.Drawing.Size(120, 30)
$btnLogin.Text = "Login Sekarang"

$btnSettings = New-Object System.Windows.Forms.Button
$btnSettings.Location = New-Object System.Drawing.Point(300, 260)
$btnSettings.Size = New-Object System.Drawing.Size(120, 30)
$btnSettings.Text = "Pengaturan"

# === Fungsi Bantu ===
function Log-Message {
    param([string]$msg)
    $timestamp = Get-Date -Format "HH:mm:ss"
    $textBoxLog.AppendText("[$timestamp] $msg`r`n")
    $textBoxLog.SelectionStart = $textBoxLog.Text.Length
    $textBoxLog.ScrollToCaret()
}

function Test-InternetConnection {
    try {
        $result = Test-NetConnection -ComputerName $Config.TargetWebsite -Port 80 -WarningAction SilentlyContinue -ErrorAction Stop
        return $result.PingSucceeded -or $result.TcpTestSucceeded
    } catch {
        return $false
    }
}

function Invoke-HotspotLogin {
    Log-Message "Mencoba login ke: $($Config.LoginUrl)"
    try {
        # Coba kirim POST ke form login (asumsi form menggunakan field 'username' dan 'password')
        $body = @{
            username = $Config.Username
            password = $Config.Password
        }
        $response = Invoke-WebRequest -Uri $Config.LoginUrl -Method POST -Body $body -UseBasicParsing -TimeoutSec 10
        if ($response.StatusCode -eq 200) {
            Log-Message "Login berhasil! Status: $($response.StatusDescription)"
            return $true
        } else {
            Log-Message "Login gagal. Status: $($response.StatusCode)"
            return $false
        }
    } catch {
        Log-Message "Error saat login: $($_.Exception.Message)"
        return $false
    }
}

# === Event Handler ===
$btnCheck.Add_Click({
    $labelStatus.Text = "Status: Memeriksa koneksi..."
    Log-Message "Memeriksa koneksi ke $($Config.TargetWebsite)..."
    if (Test-InternetConnection) {
        $labelStatus.Text = "Status: ✅ Online"
        Log-Message "Koneksi internet aktif."
    } else {
        $labelStatus.Text = "Status: ❌ Offline"
        Log-Message "Koneksi tidak aktif."
    }
})

$btnLogin.Add_Click({
    $labelStatus.Text = "Status: Sedang login..."
    Log-Message "Memulai proses login otomatis..."
    if (Invoke-HotspotLogin) {
        $labelStatus.Text = "Status: ✅ Login Berhasil"
    } else {
        $labelStatus.Text = "Status: ❌ Login Gagal"
    }
})

$btnSettings.Add_Click({
    # Buat form pengaturan sederhana
    $formSettings = New-Object System.Windows.Forms.Form
    $formSettings.Text = "Pengaturan"
    $formSettings.Size = New-Object System.Drawing.Size(400, 300)
    $formSettings.StartPosition = "CenterParent"
    $formSettings.FormBorderStyle = "FixedDialog"
    $formSettings.MaximizeBox = $false

    $y = 20
    $txtLoginUrl = New-Object System.Windows.Forms.TextBox
    $txtLoginUrl.Text = $Config.LoginUrl
    $txtLoginUrl.Location = New-Object System.Drawing.Point(120, $y)
    $txtLoginUrl.Size = New-Object System.Drawing.Size(250, 20)
    $formSettings.Controls.Add((New-Object System.Windows.Forms.Label -Property @{Location=New-Object System.Drawing.Point(20,$y); Size=New-Object System.Drawing.Size(100,20); Text="Login URL:"}))
    $formSettings.Controls.Add($txtLoginUrl); $y += 30

    $txtUsername = New-Object System.Windows.Forms.TextBox
    $txtUsername.Text = $Config.Username
    $txtUsername.Location = New-Object System.Drawing.Point(120, $y)
    $txtUsername.Size = New-Object System.Drawing.Size(150, 20)
    $formSettings.Controls.Add((New-Object System.Windows.Forms.Label -Property @{Location=New-Object System.Drawing.Point(20,$y); Size=New-Object System.Drawing.Size(100,20); Text="Username:"}))
    $formSettings.Controls.Add($txtUsername); $y += 30

    $txtPassword = New-Object System.Windows.Forms.TextBox
    $txtPassword.Text = $Config.Password
    $txtPassword.PasswordChar = '*'
    $txtPassword.Location = New-Object System.Drawing.Point(120, $y)
    $txtPassword.Size = New-Object System.Drawing.Size(150, 20)
    $formSettings.Controls.Add((New-Object System.Windows.Forms.Label -Property @{Location=New-Object System.Drawing.Point(20,$y); Size=New-Object System.Drawing.Size(100,20); Text="Password:"}))
    $formSettings.Controls.Add($txtPassword); $y += 30

    $txtTarget = New-Object System.Windows.Forms.TextBox
    $txtTarget.Text = $Config.TargetWebsite
    $txtTarget.Location = New-Object System.Drawing.Point(120, $y)
    $txtTarget.Size = New-Object System.Drawing.Size(150, 20)
    $formSettings.Controls.Add((New-Object System.Windows.Forms.Label -Property @{Location=New-Object System.Drawing.Point(20,$y); Size=New-Object System.Drawing.Size(100,20); Text="Target Website:"}))
    $formSettings.Controls.Add($txtTarget); $y += 40

    $btnSave = New-Object System.Windows.Forms.Button
    $btnSave.Text = "Simpan"
    $btnSave.Location = New-Object System.Drawing.Point(150, $y)
    $btnSave.Size = New-Object System.Drawing.Size(100, 30)
    $btnSave.Add_Click({
        $Config.LoginUrl = $txtLoginUrl.Text.Trim()
        $Config.Username = $txtUsername.Text.Trim()
        $Config.Password = $txtPassword.Text
        $Config.TargetWebsite = $txtTarget.Text.Trim()
        Log-Message "Pengaturan diperbarui."
        $formSettings.Close()
    })
    $formSettings.Controls.Add($btnSave)

    $formSettings.ShowDialog() | Out-Null
})

# === Tambahkan kontrol ke form utama ===
$form.Controls.AddRange(@($labelStatus, $textBoxLog, $btnCheck, $btnLogin, $btnSettings))

# === Mulai dengan cek koneksi otomatis ===
$form.Add_Shown({
    $labelStatus.Text = "Status: Memulai..."
    Log-Message "Aplikasi dimulai."
    if (Test-InternetConnection) {
        $labelStatus.Text = "Status: ✅ Online"
        Log-Message "Koneksi internet aktif."
    } else {
        $labelStatus.Text = "Status: ❌ Offline"
        Log-Message "Koneksi tidak aktif. Silakan login manual atau otomatis."
    }
})

# === Jalankan Aplikasi ===
$form.ShowDialog() | Out-Null