import '../model/movie.dart';

/// Data film yang di-hardcode langsung di dalam kode program
const List<Movie> movieList = [
  Movie(
    id: 1,
    title: 'Inception',
    genre: 'Sci-Fi / Thriller',
    year: 2010,
    synopsis:
        'Dom Cobb adalah seorang pencuri ahli yang memiliki kemampuan langka untuk masuk ke dalam mimpi seseorang dan mencuri rahasia dari alam bawah sadar mereka. Kemampuan ini membuatnya menjadi aset berharga di dunia spionase korporat, namun juga menjadikannya pelarian internasional yang kehilangan segalanya yang dicintainya. '
        'Cobb ditawari kesempatan untuk mendapatkan hidupnya kembali sebagai pembayaran untuk satu tugas mustahil: "inception" — menanamkan sebuah ide ke dalam pikiran seseorang. Bersama tim yang terdiri dari para ahli, Cobb harus menembus lapisan-lapisan mimpi yang semakin dalam dan berbahaya.',
    posterIcon: '🌀',
    backdropColor: '#1a237e',
    rating: 8.8,
  ),
  Movie(
    id: 2,
    title: 'Interstellar',
    genre: 'Sci-Fi / Adventure',
    year: 2014,
    synopsis:
        'Di masa depan, Bumi menghadapi krisis pangan yang parah akibat perubahan iklim ekstrem. Mantan pilot NASA bernama Cooper terpaksa meninggalkan keluarganya untuk memimpin ekspedisi melalui lubang cacing yang baru ditemukan dekat Saturnus, dalam upaya menemukan planet baru yang dapat dihuni manusia. '
        'Perjalanan melintasi ruang dan waktu ini membawa Cooper dan timnya menghadapi fenomena relativitas waktu yang luar biasa, di mana waktu berjalan berbeda di setiap planet yang mereka kunjungi. Cooper harus memilih antara menyelamatkan umat manusia atau kembali kepada putrinya sebelum terlambat.',
    posterIcon: '🚀',
    backdropColor: '#0d47a1',
    rating: 8.6,
  ),
  Movie(
    id: 3,
    title: 'The Dark Knight',
    genre: 'Action / Crime',
    year: 2008,
    synopsis:
        'Batman, Komisaris Gordon, dan jaksa Harvey Dent bergabung bersama untuk membersihkan jalanan Gotham dari kejahatan terorganisir. Namun rencana mereka terganggu oleh kemunculan seorang kriminal misterius yang dikenal sebagai The Joker, yang membawa chaos dan anarki ke seluruh kota. '
        'The Joker bukan sekadar penjahat biasa — ia adalah agen chaos yang menguji batas moral Batman dan memaksa sang pahlawan untuk membuat pilihan-pilihan yang tak pernah dibayangkan sebelumnya. Film ini menjadi salah satu film superhero terbaik sepanjang masa.',
    posterIcon: '🦇',
    backdropColor: '#212121',
    rating: 9.0,
  ),
  Movie(
    id: 4,
    title: 'Parasite',
    genre: 'Drama / Thriller',
    year: 2019,
    synopsis:
        'Keluarga Ki-taek yang miskin dan pengangguran berhasil menyusup ke dalam kehidupan keluarga Park yang kaya raya dengan cara yang cerdik dan licik. Satu per satu anggota keluarga Ki-taek berhasil mendapatkan pekerjaan di rumah mewah keluarga Park tanpa saling diketahui hubungan keluarga mereka. '
        'Namun ketika sebuah rahasia gelap tentang rumah tersebut terungkap, situasi mulai berubah menjadi jauh lebih rumit dan berbahaya dari yang dibayangkan. Film pemenang Oscar ini mengisahkan tentang kesenjangan kelas sosial dengan cara yang sangat brilian.',
    posterIcon: '🏚️',
    backdropColor: '#1b5e20',
    rating: 8.5,
  ),
  Movie(
    id: 5,
    title: 'Avengers: Endgame',
    genre: 'Action / Superhero',
    year: 2019,
    synopsis:
        'Setelah Thanos berhasil mengumpulkan semua Infinity Stones dan melenyapkan setengah dari seluruh kehidupan di alam semesta, para Avengers yang tersisa harus bersatu untuk mencari cara membalikkan tindakan Thanos. Dengan bantuan Scott Lang yang kembali dari Quantum Realm, mereka menemukan cara untuk melakukan perjalanan waktu. '
        'Misi nekat para Avengers membawa mereka ke berbagai titik waktu di masa lalu untuk mengumpulkan kembali Infinity Stones sebelum Thanos mendapatkannya. Pertarungan epik terakhir menguji batas kemampuan dan pengorbanan setiap superhero untuk menyelamatkan alam semesta.',
    posterIcon: '⚡',
    backdropColor: '#b71c1c',
    rating: 8.4,
  ),
  Movie(
    id: 6,
    title: 'Spirited Away',
    genre: 'Animation / Fantasy',
    year: 2001,
    synopsis:
        'Chihiro adalah gadis berusia 10 tahun yang sedang dalam perjalanan pindah rumah bersama orang tuanya. Ketika mereka tersesat dan memasuki sebuah terowongan misterius, mereka tiba di dunia roh yang ajaib dan berbahaya. Orang tua Chihiro berubah menjadi babi akibat sihir penyihir jahat bernama Yubaba. '
        'Untuk menyelamatkan orang tuanya dan kembali ke dunia manusia, Chihiro harus bekerja di pemandian mewah yang dikelola Yubaba dan bertemu dengan berbagai makhluk roh yang unik. Film animasi karya Hayao Miyazaki ini adalah mahakarya yang memenangkan Academy Award.',
    posterIcon: '🌸',
    backdropColor: '#4a148c',
    rating: 8.6,
  ),
  Movie(
    id: 7,
    title: 'The Godfather',
    genre: 'Drama / Crime',
    year: 1972,
    synopsis:
        'Vito Corleone adalah kepala keluarga mafia terkuat di New York. Ketika Vito menolak permintaan kerja sama dari bandar narkoba Virgil Sollozzo, ia hampir tewas dalam serangan pembunuhan. Putra bungsunya, Michael, yang sebelumnya berusaha menjauh dari bisnis keluarga, terpaksa terlibat untuk melindungi ayahnya. '
        'Michael perlahan-lahan berubah dari seorang pria yang bersih menjadi pemimpin keluarga Corleone yang dingin dan kalkulatif. Film legendaris karya Francis Ford Coppola ini dianggap sebagai salah satu film terbaik yang pernah dibuat sepanjang sejarah sinema.',
    posterIcon: '🌹',
    backdropColor: '#3e2723',
    rating: 9.2,
  ),
  Movie(
    id: 8,
    title: 'Your Name',
    genre: 'Animation / Romance',
    year: 2016,
    synopsis:
        'Mitsuha adalah gadis remaja dari kota kecil di pedesaan Jepang yang bermimpi untuk tinggal di Tokyo. Taki adalah seorang pemuda di Tokyo yang bekerja paruh waktu di restoran Italia. Suatu hari keduanya mulai mengalami kejadian aneh — mereka bertukar tubuh satu sama lain secara acak saat tidur. '
        'Melalui catatan yang ditinggalkan satu sama lain, Mitsuha dan Taki mulai mengenal dan peduli satu sama lain. Namun ketika Taki mencoba mencari Mitsuha secara langsung, ia menemukan kebenaran yang mengejutkan dan menyentuh hati tentang hubungan mereka yang melampaui ruang dan waktu.',
    posterIcon: '✨',
    backdropColor: '#880e4f',
    rating: 8.4,
  ),
];
