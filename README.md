-----

# Hotspot Auto-Pilot 🚀

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

## Gabung dengan Tim Kami

Punya ide atau saran? Rasanya ingin berkontribusi? Silakan buka **[Issue](https://www.google.com/search?q=https://github.com/your-username/your-repo-name/issues)** atau kirimkan **[Pull Request](https://www.google.com/search?q=https://github.com/your-username/your-repo-name/pulls)**.

-----

© 2023 | [Lisensi MIT](https://www.google.com/search?q=https://github.com/git/git-scm.com/blob/main/MIT-LICENSE.txt)
