# 🌟 UTS Pemrograman Mobile — Aplikasi Monitoring Multi-Fitur

👤 Terkait Aplikasi
Aplikasi ini dikembangkan sebagai proyek UTS Mata Kuliah Pemrograman Mobile oleh:
- Nama: Ananda Permana Mulyadi
- NIM: 15-2022-086
- Program Studi: Informatika
  
![Image](https://github.com/user-attachments/assets/e5c7142a-6ca4-4340-b362-c171e47a2088)

Aplikasi ini merupakan implementasi multi-page mobile app berbasis Flutter, dengan integrasi berbagai fitur sederhana seperti biodata interaktif, daftar kontak, kalkulator, informasi cuaca statis, dan berita lokal

🚀 Fitur Utama

🪪 1. Halaman Biodata

Menampilkan informasi pribadi pengguna dengan UI modern dan gradasi warna elegan, dilengkapi input untuk:
- Program Studi (Dropdown)
- Jenis Kelamin (Radio)
- Alamat (TextField)
- Tanggal Lahir (DatePicker)
  
![Image](https://github.com/user-attachments/assets/e7333272-3782-4c79-a91a-b5a217e03555)

📇 2. Halaman Kontak

Berisi daftar 15 kontak statis lengkap dengan nama, nomor telepon, dan avatar.

Pengguna dapat menekan ikon telepon untuk menampilkan notifikasi SnackBar “Panggil [nomor]”.

![Image](https://github.com/user-attachments/assets/51852a29-dd44-4689-9fa3-1f309be6f1bf)

🔢 3. Halaman Kalkulator

Kalkulator sederhana yang mendukung operasi dasar:
- Penjumlahan (+)
- Pengurangan (−)
- Perkalian (×)
- Pembagian (÷)
- Operasi satu argumen (x² dan √)
Menampilkan hasil dalam format yang rapi dan responsif.

![Image](https://github.com/user-attachments/assets/a8811d05-4c3e-4556-9249-d6cfe07b1c22)

🌤️ 4. Halaman Cuaca

Menampilkan informasi cuaca lokal secara statis dengan ilustrasi visual dari aset gambar (assets/images/cuaca1.png, dst).

Terdiri dari cuaca hari ini dan prakiraan untuk 4 hari ke depan.

![Image](https://github.com/user-attachments/assets/e899f73b-a8bf-44eb-8710-bc2711462dc3)

📰 5. Halaman Berita

Menampilkan kumpulan berita dummy lokal dengan gambar dan deskripsi singkat.

Tiap berita dapat diklik untuk membuka dialog detailnya.

![Image](https://github.com/user-attachments/assets/5016bcbd-ab26-442a-b85a-5c0b233aca07)


⚙️ Teknologi yang Digunakan
- Framework: Flutter (SDK 3.9.2)
- Bahasa: Dart
- Dependency utama:
    - intl → untuk format tanggal
    - http → (opsional, untuk API di masa depan)
- UI Components: Material Design, Card, BottomNavigationBar, IndexedStack


🧭 Alur Navigasi

Aplikasi menggunakan Bottom Navigation Bar dengan 5 tab:

Biodata | Kontak | Kalkulator | Cuaca | Berita

Navigasi utama diatur menggunakan IndexedStack, agar tiap halaman tetap mempertahankan state-nya saat berpindah tab.



## Cara Menjalankan Aplikasi

1. Clone repositori ini
   git clone https://github.com/AnandaPermanaMulyadi/UTS_Mobile_152022086.git
cd UTS_Mobile_152022086

2. Jalankan perintah berikut untuk mengunduh dependency:
   
   flutter pub get

4. Jalankan aplikasi di emulator atau perangkat Android:
   
   flutter run



📚 Tentang Proyek Ini

Proyek ini merupakan hasil UTS mata kuliah Pemrograman Mobile, yang menilai kemampuan mahasiswa dalam:
- Mendesain UI Flutter yang interaktif
- Mengimplementasikan navigasi antar halaman
- Mengintegrasikan widget dan komponen dasar Flutter






