# 🎓 KampusKita — Aplikasi Informasi Kegiatan & Organisasi Mahasiswa

> **UTS Praktik Mobile Programming** | Flutter & Dart | Material Design 3

---

## 📋 Deskripsi Aplikasi

**KampusKita** adalah aplikasi mobile berbasis Flutter yang menyajikan informasi kegiatan (acara) dan organisasi mahasiswa kampus secara terpusat. Dirancang dengan antarmuka modern menggunakan Material Design 3 dan palet warna ungu `#6C4AB6`.

Aplikasi ini memenuhi ketentuan UTS Mobile Programming dengan:
- ✅ Minimal tiga halaman berbeda yang terhubung melalui navigasi
- ✅ Berbagai widget dan layout Flutter
- ✅ Data dummy terstruktur dan terpisah dari UI
- ✅ UI modern, konsisten, dan responsif
- ✅ Arsitektur modular yang siap dikembangkan ke API

---

## ✨ Fitur Utama

| Fitur | Keterangan |
|---|---|
| 🏠 **Beranda** | Header gradient, statistik ringkas, kategori kegiatan, akses cepat, dan acara pilihan |
| 🗓️ **Daftar Kegiatan** | 8 acara dengan pencarian real-time (nama/lokasi/penyelenggara) dan filter kategori |
| 🏛️ **Organisasi Mahasiswa** | 6 organisasi dengan filter kategori dan detail dalam modal bottom sheet |
| 📄 **Detail Acara** | Informasi lengkap (tanggal, waktu, lokasi, deskripsi) dengan header gradient sesuai kategori |
| 🔍 **Pencarian** | Filter real-time berdasarkan nama acara, lokasi, dan penyelenggara |
| 🧭 **Navigasi** | `NavigationBar` (Material 3) + `Navigator.push/pop` antar halaman detail |

---

## 📁 Struktur Folder

```
lib/utsprak/
├── main.dart                    # Entry point: KampusKitaApp + MainShell (BottomNav)
│
├── models/
│   ├── event_model.dart         # Model Event (JSON-ready)
│   └── organization_model.dart  # Model Organization (JSON-ready)
│
├── data/
│   ├── events_data.dart         # 8 data dummy acara kampus
│   └── organizations_data.dart  # 6 data dummy organisasi
│
├── theme/
│   └── app_theme.dart           # ThemeData Material 3, palet warna, kategori
│
├── widgets/
│   ├── event_card.dart          # Widget EventCard (reusable)
│   └── organization_card.dart   # Widget OrganizationCard (reusable)
│
└── screens/
    ├── home_screen.dart          # Halaman Beranda
    ├── events_screen.dart        # Halaman Daftar Kegiatan
    ├── organizations_screen.dart # Halaman Organisasi
    └── event_detail_screen.dart  # Halaman Detail Acara
```

---

## 📦 Widget yang Digunakan

| Widget | Digunakan di |
|---|---|
| `MaterialApp` | `main.dart` (utsprak) |
| `Scaffold` | Semua halaman |
| `AppBar` / `SliverAppBar` | HomeScreen, EventsScreen, OrganizationsScreen, EventDetailScreen |
| `SafeArea` | MainShell |
| `Row` & `Column` | Semua halaman dan widget |
| `Container` | EventCard, OrganizationCard, chips |
| `Padding` | Semua halaman |
| `Card` (via custom Container) | EventCard, OrganizationCard |
| `ListView` / `ListView.builder` | EventsScreen, OrganizationsScreen, HomeScreen (kategori) |
| `TextField` | EventsScreen (pencarian) |
| `Icon` | Semua halaman |
| `NavigationBar` | MainShell |
| `Navigator.push` & `Navigator.pop` | HomeScreen → EventsScreen, EventDetailScreen; EventsScreen → EventDetailScreen |
| `IndexedStack` | MainShell |
| `CustomScrollView` + `SliverAppBar` | HomeScreen, EventDetailScreen |
| `AnimatedContainer` | Filter kategori chip |
| `ModalBottomSheet` | OrganizationsScreen (detail organisasi) |

---

## 🚀 Cara Menjalankan Aplikasi

### Prasyarat
- Flutter SDK ≥ 3.10.0
- Dart SDK ≥ 3.0.0

### Langkah-langkah

```bash
# 1. Masuk ke direktori proyek
cd "d:/iam/tugas kuliah/Semester 5/teori/mobile programming/pertemuan_01"

# 2. Install dependencies
flutter pub get

# 3. Jalankan di emulator atau perangkat fisik
flutter run

# 4. Atau jalankan di Chrome (web)
flutter run -d chrome
```

### Navigasi ke KampusKita
Setelah aplikasi berjalan, pilih tombol **"🎓 UTS Prak - KampusKita"** dari menu utama.

---

## 🧪 Pengujian Manual

### ✅ Daftar Pengujian

| # | Skenario | Langkah | Hasil yang Diharapkan |
|---|---|---|---|
| 1 | Beranda tampil | Buka aplikasi → pilih KampusKita | Halaman beranda tampil dengan header, statistik, kategori, dan 3 acara pilihan |
| 2 | Navigasi tab | Tekan tab "Kegiatan" dan "Organisasi" | Perpindahan halaman tanpa error |
| 3 | Pencarian acara | Buka tab Kegiatan → ketik "Flutter" | Hanya acara "Workshop Flutter" yang tampil |
| 4 | Pencarian kosong | Ketik kata yang tidak ada | Muncul state kosong dengan ilustrasi |
| 5 | Reset filter | Klik "Reset Filter" | Semua acara ditampilkan kembali |
| 6 | Filter kategori | Pilih kategori "Kompetisi" | Hanya 2 acara kompetisi yang tampil |
| 7 | Detail acara | Tekan kartu acara mana saja | EventDetailScreen tampil dengan data acara yang TEPAT sesuai kartu yang ditekan |
| 8 | Kembali dari detail | Tekan tombol "Kembali" | Kembali ke halaman sebelumnya |
| 9 | Filter organisasi | Buka tab Organisasi → pilih "Teknologi" | Hanya KDM yang tampil |
| 10 | Detail organisasi | Tekan kartu organisasi | Modal bottom sheet tampil dengan info lengkap |
| 11 | Navigasi dari beranda | Tekan "Semua Acara" dari beranda | Berpindah ke EventsScreen |
| 12 | Filter dari kategori beranda | Tekan chip kategori "Seminar" | Buka EventsScreen dengan filter "Seminar" aktif |
| 13 | Tidak ada overflow | Coba di berbagai ukuran layar | Tidak ada RenderOverflow error |

### ⚠️ Hal yang Masih Perlu Dikembangkan

- [ ] Integrasi dengan REST API kampus untuk data real-time
- [ ] Halaman pendaftaran acara (form)
- [ ] Fitur bookmark/simpan acara favorit
- [ ] Notifikasi pengingat sebelum acara dimulai
- [ ] Profil mahasiswa dengan riwayat kegiatan
- [ ] Dark mode

---

## 🎨 Desain

- **Warna Utama:** `#6C4AB6` (Ungu)
- **Tipografi:** Roboto (Material 3 default)
- **Design System:** Material Design 3
- **Card Radius:** 16dp
- **Gradient:** Linear gradient dari `#4A2E8E` → `#6C4AB6` → `#9B79E0`

---

## 👤 Informasi

| | |
|---|---|
| **Mata Kuliah** | Mobile Programming |
| **Semester** | 5 |
| **Jenis Tugas** | UTS Praktik |
| **Aplikasi** | KampusKita v1.0.0 |
| **Framework** | Flutter + Dart |
