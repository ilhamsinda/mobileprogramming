import '../models/organization_model.dart';

/// Data dummy organisasi mahasiswa kampus.
/// File ini terpisah dari UI agar mudah diganti dengan API call di masa depan.
const List<Organization> dummyOrganizations = [
  Organization(
    id: 'org001',
    name: 'BEM Universitas',
    category: 'Eksekutif',
    description:
        'Badan Eksekutif Mahasiswa tingkat universitas yang berperan sebagai representasi aspirasi seluruh mahasiswa kepada pihak institusi. BEM aktif menyelenggarakan program sosial, advokasi kebijakan, dan kegiatan pengembangan mahasiswa berskala universitas.',
    memberCount: '120 Anggota Aktif',
    founded: '1998',
  ),
  Organization(
    id: 'org002',
    name: 'Himpunan Mahasiswa Teknik Informatika (HIMATIKA)',
    category: 'Himpunan',
    description:
        'Organisasi kemahasiswaan tingkat jurusan Teknik Informatika yang berfokus pada pengembangan kompetensi teknologi anggotanya. HIMATIKA aktif mengadakan seminar, workshop coding, kompetisi pemrograman, dan studi banding ke perusahaan teknologi terkemuka.',
    memberCount: '85 Anggota Aktif',
    founded: '2005',
  ),
  Organization(
    id: 'org003',
    name: 'Unit Kegiatan Mahasiswa Seni & Budaya (UKM SENBU)',
    category: 'Seni & Budaya',
    description:
        'UKM yang berkomitmen melestarikan dan mengembangkan seni budaya Nusantara di lingkungan kampus. Memiliki divisi tari tradisional, karawitan, teater, paduan suara, dan seni rupa. Rutin tampil di acara internal maupun festival budaya tingkat regional.',
    memberCount: '200 Anggota Aktif',
    founded: '2001',
  ),
  Organization(
    id: 'org004',
    name: 'Unit Kegiatan Mahasiswa Olahraga (UKM SPORT)',
    category: 'Olahraga',
    description:
        'Wadah bagi mahasiswa yang ingin mengembangkan bakat dan prestasi olahraga. Memiliki cabang futsal, basket, badminton, voli, renang, dan atletik. UKM SPORT telah menghasilkan atlet berprestasi di tingkat provinsi dan nasional.',
    memberCount: '300 Anggota Aktif',
    founded: '1999',
  ),
  Organization(
    id: 'org005',
    name: 'Komunitas Developer Mahasiswa (KDM)',
    category: 'Teknologi',
    description:
        'Komunitas belajar bersama bagi mahasiswa yang tertarik dunia pengembangan software, mobile app, web, dan IoT. KDM rutin mengadakan study group, workshop, code review session, dan build bareng project open source.',
    memberCount: '150 Anggota Aktif',
    founded: '2015',
  ),
  Organization(
    id: 'org006',
    name: 'Lembaga Inovasi & Riset Mahasiswa (LIRM)',
    category: 'Riset & Inovasi',
    description:
        'Lembaga yang mendorong budaya riset dan inovasi di kalangan mahasiswa. LIRM mengelola jurnal mahasiswa, menyelenggarakan hackathon, dan memfasilitasi inkubasi ide startup. Bermitra dengan pemerintah daerah untuk menghadirkan solusi inovatif berbasis teknologi.',
    memberCount: '75 Anggota Aktif',
    founded: '2018',
  ),
];
