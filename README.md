# 🍛 DapurChrist – Food Shop POS Application

## 📱 Deskripsi Aplikasi

DapurChrist merupakan aplikasi **Point of Sales (POS)** sederhana bertema toko makanan Indonesia yang dikembangkan menggunakan Flutter. Aplikasi ini dirancang untuk membantu pengelolaan inventaris makanan dan proses transaksi secara lokal. Pengguna dapat menambahkan menu makanan, mengelola stok, serta melakukan simulasi proses checkout seperti pada sistem kasir.

---

## ✨ Fitur Utama

### 🧾 1. CRUD Produk (Menu Makanan)

* Menambahkan menu makanan baru
* Melihat daftar menu makanan
* Menghapus produk
* Informasi produk meliputi:

  * Nama makanan
  * Kategori (Makanan / Minuman)
  * Stok
  * Harga

### 🛒 2. Sistem Kasir / Checkout

* Pengguna dapat melakukan simulasi pembelian makanan
* Total harga ditampilkan saat checkout
* Stok makanan otomatis berkurang setelah transaksi berhasil

### 📊 3. Histori Penjualan (Bonus Feature)

* Menyimpan riwayat transaksi
* Menampilkan:

  * Nama makanan
  * Total harga
  * Tanggal transaksi

### 👤 4. About Me

Halaman profil yang berisi:

* Foto profil
* Nama lengkap
* Nama panggilan
* Hobi
* Username media sosial

---

## 🧩 Packages / Third-Party yang Digunakan

* **provider** → State management
* **intl** → Format tanggal dan currency
* **flutter/material.dart** → UI framework

---

## 🏗️ Struktur Project

```
lib/
 ┣ models/
 ┣ providers/
 ┣ screens/
 ┗ main.dart
```

---

## 🚀 Cara Menjalankan Aplikasi

1. Clone repository:

```
https://github.com/christnayosua/DapurChristna.git
```

2. Masuk ke folder project:

```
cd dapurchirst
```

3. Install dependencies:

```
flutter pub get
```

4. Jalankan aplikasi:

```
flutter run
```

---

## 📚 Lesson Learned

Selama proses pengembangan aplikasi ini, saya mempelajari bagaimana membangun aplikasi mobile menggunakan Flutter dengan pendekatan state management menggunakan Provider. Saya juga belajar mengenai struktur project yang lebih terorganisir, pengelolaan data produk, serta implementasi logika bisnis sederhana seperti pengurangan stok secara otomatis saat transaksi berlangsung. Selain itu, proses ini meningkatkan pemahaman saya mengenai alur pengembangan aplikasi POS dan bagaimana menerapkan konsep clean code agar aplikasi lebih mudah dikembangkan di masa depan.

---

## 🔗 Repository

GitHub Repository:
https://github.com/christnayosua/dapurchirst.git
