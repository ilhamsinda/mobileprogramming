import '../models/event_model.dart';

/// Data dummy acara kampus.
/// File ini terpisah dari UI agar mudah diganti dengan API call di masa depan.
const List<Event> dummyEvents = [
  Event(
    id: 'evt001',
    title: 'Seminar Nasional Kecerdasan Buatan 2024',
    category: 'Seminar',
    date: '15 November 2024',
    time: '08.00 – 16.00 WIB',
    location: 'Aula Utama Universitas, Gedung Rektorat Lt. 3',
    description:
        'Seminar nasional bertema "AI untuk Indonesia Maju" menghadirkan pakar AI dari Google Indonesia, Gojek, dan akademisi terkemuka. Peserta akan mendapatkan wawasan terkini tentang penerapan kecerdasan buatan di berbagai sektor industri dan pemerintahan. Tersedia sesi tanya jawab, workshop singkat, dan networking bersama profesional AI.',
    organizer: 'Himpunan Mahasiswa Teknik Informatika (HIMATIKA)',
  ),
  Event(
    id: 'evt002',
    title: 'KompFest 2024 – Kompetisi Pemrograman Tingkat Nasional',
    category: 'Kompetisi',
    date: '22–23 November 2024',
    time: '07.30 – 18.00 WIB',
    location: 'Lab Komputer Gedung B, Fakultas Ilmu Komputer',
    description:
        'Kompetisi pemrograman bergengsi tingkat nasional yang terbuka untuk mahasiswa aktif seluruh Indonesia. Kategori lomba: Competitive Programming, Hackathon 24 jam, dan Mobile App Development. Total hadiah mencapai Rp 50.000.000. Daftarkan timmu sekarang!',
    organizer: 'BEM Fakultas Ilmu Komputer',
  ),
  Event(
    id: 'evt003',
    title: 'Workshop Flutter & Dart untuk Pemula',
    category: 'Workshop',
    date: '5 Desember 2024',
    time: '09.00 – 15.00 WIB',
    location: 'Ruang Seminar 201, Gedung Teknologi',
    description:
        'Workshop intensif belajar Flutter dari nol hingga bisa membuat aplikasi mobile sederhana. Dibimbing oleh developer berpengalaman dari komunitas Flutter Indonesia. Peserta diharapkan membawa laptop dengan Flutter SDK terinstall. Kuota terbatas 40 orang, daftar segera!',
    organizer: 'Komunitas Developer Mahasiswa (KDM)',
  ),
  Event(
    id: 'evt004',
    title: 'Gelar Seni & Budaya Nusantara 2024',
    category: 'Budaya',
    date: '10 Desember 2024',
    time: '16.00 – 22.00 WIB',
    location: 'Lapangan Utama Kampus',
    description:
        'Festival seni dan budaya tahunan menampilkan pertunjukan tari tradisional dari 10 provinsi, pameran batik, pertunjukan musik daerah, dan kuliner Nusantara. Acara ini merupakan wujud apresiasi terhadap keberagaman budaya Indonesia. Terbuka untuk umum, gratis!',
    organizer: 'Unit Kegiatan Mahasiswa Seni & Budaya (UKM SENBU)',
  ),
  Event(
    id: 'evt005',
    title: 'Turnamen Futsal Antar-Fakultas Champion Cup 2024',
    category: 'Olahraga',
    date: '14–15 Desember 2024',
    time: '08.00 – 17.00 WIB',
    location: 'Lapangan Futsal Indoor Kampus, Gedung Olahraga',
    description:
        'Turnamen futsal bergengsi antar-fakultas dengan format liga dan sistem gugur. Setiap fakultas dapat mendaftarkan 2 tim. Total 16 tim akan bersaing memperebutkan piala bergilir dan uang pembinaan. Suporter diperbolehkan hadir dan dukung tim favorit kalian!',
    organizer: 'Unit Kegiatan Mahasiswa Olahraga (UKM SPORT)',
  ),
  Event(
    id: 'evt006',
    title: 'Career Day 2024 – Buka Peluangmu',
    category: 'Karir',
    date: '20 Desember 2024',
    time: '09.00 – 16.00 WIB',
    location: 'Lobby Gedung Utama & Aula B',
    description:
        'Pameran karir terbesar kampus menghadirkan 50+ perusahaan nasional dan multinasional. Tersedia booth rekrutmen langsung, sesi coaching CV, mock interview dengan HRD, dan seminar tips menembus perusahaan impian. Bawa CV terbaikmu dan raih kesempatan karir!',
    organizer: 'Pusat Pengembangan Karir Mahasiswa (Career Center)',
  ),
  Event(
    id: 'evt007',
    title: 'Pelatihan Kepemimpinan Mahasiswa (LKMM-TD)',
    category: 'Pengembangan Diri',
    date: '3–5 Januari 2025',
    time: 'Mulai 07.00 WIB (3 hari)',
    location: 'Balai Pelatihan Kampus, Jl. Pendidikan No. 12',
    description:
        'Latihan Kepemimpinan dan Manajemen Mahasiswa Tingkat Dasar (LKMM-TD) dirancang untuk membentuk karakter pemimpin mahasiswa yang berintegritas, inovatif, dan berdampak. Materi meliputi: kepemimpinan situasional, manajemen organisasi, komunikasi efektif, dan studi kasus organisasi kampus.',
    organizer: 'BEM Universitas',
  ),
  Event(
    id: 'evt008',
    title: 'Hackathon Inovasi Daerah – SmartCity Challenge',
    category: 'Kompetisi',
    date: '18–19 Januari 2025',
    time: '24 Jam Non-Stop (Mulai 08.00 WIB)',
    location: 'Pusat Inovasi Kampus (Co-Working Space), Lantai 2',
    description:
        'Hackathon 24 jam bertema solusi digital untuk kota pintar. Tim beranggotakan 3–5 orang diminta merancang dan memprototype solusi teknologi untuk permasalahan nyata perkotaan seperti transportasi, lingkungan, atau layanan publik. Mentoring dari startup founder dan pejabat daerah.',
    organizer: 'Lembaga Inovasi & Riset Mahasiswa (LIRM)',
  ),
];
