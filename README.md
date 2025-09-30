# Versi CMD

-----

## Hotspot Auto-Pilot 🚀

**Pernah kesal karena hotspot tiba-tiba logout?**
**Selamat tinggal masalah\!** Dengan **Hotspot Auto-Pilot**, Anda tidak perlu lagi khawatir tentang koneksi yang terputus. Skrip pintar ini akan menjadi "pilot" pribadi Anda, yang selalu memastikan Anda tetap terhubung tanpa harus mengurusinya secara manual.

-----

## Apa Ini?

**Hotspot Auto-Pilot** adalah skrip otomatis yang dibuat dengan Batch untuk Windows. Tujuannya sederhana: membuat hidup Anda lebih mudah dengan mengotomatisasi proses login hotspot Mikrotik. Cukup jalankan sekali, dan biarkan skrip ini yang bekerja di belakang layar.

## Fitur Unggulan ✨

  - **Mata-mata Koneksi:** Skrip ini secara cerdas memantau koneksi internet Anda. Jika terdeteksi putus, ia akan segera bertindak.
  - **Detektif Browser:** Tak peduli browser apa yang Anda pakai, skrip ini akan menemukannya\! Ia mendukung **Chrome**, **Firefox**, **Edge**, **Brave**, dan **Opera** secara otomatis.
  - **Login Kilat:** Setelah mendeteksi masalah, ia akan membuka halaman login, mengisi username dan password Anda dalam sekejap mata, dan menekan tombol login.
  - **Loop Abadi:** Skrip ini tidak pernah lelah. Ia akan terus berjalan di latar belakang, memastikan koneksi Anda tetap stabil 24/7.

-----

## Cara Pakai 🚀

### 1\. Dapatkan Kodenya

Salin kode dari file `smart_autologin.bat` ke dalam editor teks (seperti Notepad), lalu simpan dengan nama **`hotspot-auto-pilot.bat`**.

### 2\. Isi Formulir Rahasia Anda

Buka file yang baru Anda simpan dan ubah bagian konfigurasi ini:

```batch
REM --- Konfigurasi ---
set "login_url=http://192.168.1.1/login"
set "username=user_anda"
set "password=password_anda"
set "target_website=www.google.com"
set /a "loop_delay=30"
```

  - `login_url`: Ubah dengan alamat login hotspot Anda.
  - `username` & `password`: Masukkan data login Anda. **(Ingat, ini disimpan dalam teks biasa\!)**
  - `loop_delay`: Atur seberapa sering skrip ini memeriksa koneksi (dalam detik).

### 3\. Terbang\! ✈️

Klik dua kali pada file **`hotspot-auto-pilot.bat`**. Sebuah jendela hitam akan muncul, dan skrip akan mulai menjalankan tugasnya. Anda bisa membiarkan jendela ini terbuka di latar belakang.

-----

## Bagaimana Cara Kerjanya? 🛠️

Di balik layar, **Hotspot Auto-Pilot** menggunakan kombinasi **Batch** dan **JScript**.

1.  **Pendeteksi Cerdas:** Menggunakan perintah `if exist` untuk menemukan file executable browser yang terinstal.
2.  **Uji Coba Koneksi:** Melakukan `ping` ke `www.google.com` untuk memastikan koneksi internet aktif.
3.  **Aksi Login:** Jika `ping` gagal, skrip membuat file JScript sementara yang berfungsi untuk mengirim perintah ke browser, seperti menekan `TAB` dan mengetikkan `username` dan `password`.
4.  **Sistem Looping:** Menggunakan perintah `goto` untuk terus berulang dan memantau status koneksi Anda.

-----

## Penting\! Baca Ini Dulu ⚠️

  - **Keamanan:** Username dan password Anda disimpan dalam file teks. Pastikan skrip ini hanya digunakan di komputer yang aman dan pribadi.
  - **Kompatibilitas:** Skrip ini mungkin tidak bekerja pada halaman login yang sangat kompleks (misalnya, yang menggunakan CAPTCHA atau validasi khusus).

-----


# Versi Power Shell

# 🌐 Hotspot Auto-Login (GUI Edition)  
> **"Koneksi putus? Auto-login siap sambung!"**  

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)  
[![PowerShell](https://img.shields.io/badge/Powered%20by-PowerShell-5391FE?logo=powershell&logoColor=white)](https://docs.microsoft.com/en-us/powershell/)  
[![Windows](https://img.shields.io/badge/Platform-Windows-0078D7?logo=windows)](https://www.microsoft.com/windows)

---

## 💡 Apa Ini?
**Hotspot Auto-Login** adalah alat ringan berbasis **PowerShell GUI** yang membantu Anda **otomatis login ke hotspot publik** (seperti jaringan kampus, hotel, atau kafe) tanpa repot membuka browser dan mengisi form berulang kali!

> Bayangkan:  
> - WiFi tiba-tiba minta login ulang saat meeting online? ✅  
> - Jaringan kampus sering disconnect? ✅  
> - Malas ketik username/password tiap kali? ✅  

**Solusi satu klik — langsung nyambung!**

---

## 🚀 Fitur Utama
- ✨ **Antarmuka GUI yang simpel dan user-friendly**  
- 🔌 **Cek koneksi internet secara real-time**  
- 🤖 **Login otomatis via HTTP POST (tanpa buka browser!)**  
- ⚙️ **Pengaturan fleksibel**: ganti URL, username, password, dan target website  
- 📜 **Log aktivitas lengkap** dengan timestamp  
- 🛡️ **Password disembunyikan** di form pengaturan  
- 💻 **Ringan & portable** — tidak perlu instalasi!

---


## 📦 Cara Menggunakan

### Prasyarat
- Windows 7/8/10/11  
- PowerShell 5.1+ (sudah terpasang bawaan Windows)

### Langkah Instalasi
1. **Download** file [`HotspotAutoLogin.ps1`](HotspotAutoLogin.ps1)
2. **Klik kanan** → **"Run with PowerShell"**  
   *(Jika muncul error kebijakan, jalankan perintah berikut di PowerShell sebagai Admin):*
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```
3. **Atur konfigurasi** Anda via tombol **"Pengaturan"**:
   - Login URL (misal: `http://itbi.net/login`)
   - Username & Password
   - Website target untuk cek koneksi (misal: `www.google.com`)
4. Klik **"Cek Koneksi"** atau **"Login Sekarang"** — selesai! 🎉

---

## 🔧 Catatan Teknis
- Aplikasi ini bekerja dengan asumsi form login hotspot menggunakan **field `username` dan `password`**.  
  Jika form Anda berbeda (misal: `user`, `pass`, atau pakai token), Anda perlu sesuaikan bagian `$body` di fungsi `Invoke-HotspotLogin`.
- Tidak menyimpan data secara permanen (untuk keamanan).  
  Ingin fitur simpan konfigurasi? [Buka issue!](../../issues)

---

## 🛡️ Keamanan
- Password **tidak disimpan di file** atau dikirim ke server eksternal.
- Semua proses berjalan **lokal di perangkat Anda**.
- Disarankan hanya digunakan di lingkungan tepercaya (kampus, kantor, dll).

> ⚠️ **Peringatan**: Jangan gunakan di hotspot publik tidak dikenal! Pastikan URL login resmi.

---

## 🤝 Kontribusi
Ingin tambah fitur? Perbaiki bug?  
Silakan:
1. Fork repositori ini  
2. Buat branch baru (`git checkout -b fitur-baru`)  
3. Commit perubahan (`git commit -m 'Tambah fitur keren'`)  
4. Push ke branch (`git push origin fitur-baru`)  
5. Buka Pull Request  

Semua kontribusi **sangat dihargai!**

---

## 📜 Lisensi
Distribusikan di bawah lisensi **MIT**.  
Lihat file [LICENSE](LICENSE) untuk detailnya.

---

## 💬 Penulis
Dibuat dengan ❤️ oleh **Mr.exe**  
> *"Karena hidup terlalu singkat untuk login manual berulang kali."*

---

## 🌟 Jangan Lupa!
- ⭐ **Star** repositori ini jika bermanfaat!  
- 🐞 Laporkan bug via [Issues](../../issues)  
- 📣 Bagikan ke teman yang sering kehilangan koneksi WiFi!

---

> **"Auto-login bukan kemewahan — itu hak dasar setiap pejuang WiFi!"** 😎
