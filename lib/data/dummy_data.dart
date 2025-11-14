// 📦 lib/data/daftar_data.dart
// =======================================================
// 🎓 DATA SIAKAD — MAHASISWA, DOSEN, DAN MATA KULIAH
// =======================================================

import '../models/mahasiswa.dart';
import '../models/matakuliah.dart';
import '../models/dosen.dart';
import '../models/krs.dart';
import '../models/nilai.dart';

/// =======================================================
/// 🧑‍🎓 DATA MAHASISWA DUMMY
/// =======================================================

final List<Mahasiswa> daftarMahasiswa = [
  Mahasiswa(
    nama: 'Dewi Yulianti',
    nim: '2320557010',
    prodi: 'Sistem Informasi',
    semester: 5,
    nilaiSemester: {
      // Contoh nilai awal (boleh dikosongkan kalau belum ada nilai)
      'MK001': Nilai(
        nim: '2320557010',
        kodeMK: 'MK001',
        namaMK: 'Analisis Sistem Informasi',
        angka: 0,
        huruf: '-',
      ),
    },
  ),
  Mahasiswa(
    nama: 'La Ode Rifki Supratman Salim',
    nim: '2320556007',
    prodi: 'Teknik Komputer',
    semester: 5,
    nilaiSemester: {
      'MK002': Nilai(
        nim: '2320556007',
        kodeMK: 'MK002',
        namaMK: 'Jaringan Komputer',
        angka: 0,
        huruf: '-',
      ),
    },
  ),
  Mahasiswa(
    nama: 'Ayu Puspita',
    nim: '2203003',
    prodi: 'Sistem Informasi',
    semester: 1,
    nilaiSemester: {
      'MK003': Nilai(
        nim: '2203003',
        kodeMK: 'MK003',
        namaMK: 'Pengantar Teknologi Informasi',
        angka: 0,
        huruf: '-',
      ),
    },
  ),
  Mahasiswa(
    nama: 'Budi Santoso',
    nim: '220101001',
    prodi: 'Informatika',
    semester: 3,
    nilaiSemester: {
      'MK001': Nilai(
        nim: '220101001',
        kodeMK: 'MK001',
        namaMK: 'Pemrograman Dasar',
        angka: 90,
        huruf: 'A',
      ),
      'MK002': Nilai(
        nim: '220101001',
        kodeMK: 'MK002',
        namaMK: 'Struktur Data',
        angka: 85,
        huruf: 'A-',
      ),
    },
  ),
];


/// =======================================================
/// 📘 DATA MATA KULIAH
/// =======================================================
final List<MataKuliah> daftarMataKuliah = [
  // ===============================
  // 🎓 SEMESTER I (SI & TK)
  // ===============================
  MataKuliah(
    kode: 'PI001',
    nama: 'Pendidikan Agama',
    sks: 2,
    dosenPengampu: 'Rudin, S.Sos., M.Si',
    kapasitas: 30,
    jadwal: ['Senin 08:00 - 09:30'],
  ),
  MataKuliah(
    kode: 'PI002',
    nama: 'Pendidikan Pancasila',
    sks: 2,
    dosenPengampu: 'Rahmatia, S.E., M.M',
    kapasitas: 30,
    jadwal: ['Selasa 09:30 - 11:00'],
  ),
  MataKuliah(
    kode: 'PI003',
    nama: 'Bahasa Inggris 3',
    sks: 2,
    dosenPengampu: 'Iswuri Handayani, M.Kom',
    kapasitas: 30,
    jadwal: ['Rabu 08:00 - 09:30'],
  ),
  MataKuliah(
    kode: 'PI004',
    nama: 'Teknologi Informasi',
    sks: 2,
    dosenPengampu: 'Etika Purnamasari, S.T., M.A.P',
    kapasitas: 25,
    jadwal: ['Kamis 10:00 - 11:30'],
  ),
  MataKuliah(
    kode: 'PI005',
    nama: 'Logika Informatika',
    sks: 2,
    dosenPengampu: 'Iswuri Handayani, M.Kom',
    kapasitas: 30,
    jadwal: ['Jumat 08:00 - 09:30'],
  ),
  MataKuliah(
    kode: 'PI007',
    nama: 'Perangkat Lunak Aplikasi',
    sks: 3,
    dosenPengampu: 'Nelisa, M.Kom',
    kapasitas: 25,
    jadwal: ['Sabtu 09:00 - 11:15'],
  ),
  MataKuliah(
    kode: 'PSI001',
    nama: 'Konsep Dasar Manajemen',
    sks: 2,
    dosenPengampu: 'Etika Purnamasari, S.T., M.A.P',
    kapasitas: 25,
    jadwal: ['Senin 13:00 - 14:30'],
  ),
  // TK khusus
  MataKuliah(
    kode: 'PTK003',
    nama: 'Elektronika Dasar',
    sks: 2,
    dosenPengampu: 'Jasman, S.Kom., M.Kom',
    kapasitas: 25,
    jadwal: ['Selasa 13:00 - 14:30'],
  ),
  MataKuliah(
    kode: 'PTK022',
    nama: 'Perangkat Lunak Utilitas',
    sks: 2,
    dosenPengampu: 'Irfan Sepria Baresi, S.Kom., M.M',
    kapasitas: 25,
    jadwal: ['Rabu 15:00 - 16:30'],
  ),

  // ===============================
  // 💻 SEMESTER III
  // ===============================
  MataKuliah(
    kode: 'PI013',
    nama: 'Desain Basis Data',
    sks: 3,
    dosenPengampu: 'Etika Purnamasari, S.T., M.A.P',
    kapasitas: 25,
    jadwal: ['Senin 08:00 - 10:15'],
  ),
  MataKuliah(
    kode: 'PI015',
    nama: 'Pemrograman Database I',
    sks: 3,
    dosenPengampu: 'Wahyudin Fadila, S.Kom',
    kapasitas: 25,
    jadwal: ['Selasa 13:00 - 15:15'],
  ),
  MataKuliah(
    kode: 'PTK011',
    nama: 'Desain & Instalasi Komputer',
    sks: 3,
    dosenPengampu: 'Irfan Sepria Baresi, S.Kom., M.M',
    kapasitas: 25,
    jadwal: ['Rabu 08:00 - 10:15'],
  ),
  MataKuliah(
    kode: 'PTK012',
    nama: 'Konsep Dasar Jaringan Komputer',
    sks: 2,
    dosenPengampu: 'Lidya Rahayu Ningrum, S.Si',
    kapasitas: 25,
    jadwal: ['Kamis 09:15 - 10:30'],
  ),
  MataKuliah(
    kode: 'PTK013',
    nama: 'Sensor & Transducer',
    sks: 2,
    dosenPengampu: 'Syahran, S.T., M.T',
    kapasitas: 25,
    jadwal: ['Jumat 08:00 - 09:30'],
  ),
  MataKuliah(
    kode: 'PI006',
    nama: 'Sistem Operasi',
    sks: 3,
    dosenPengampu: 'Salfin, S.Kom., M.Si',
    kapasitas: 25,
    jadwal: ['Jumat 10:00 - 12:00'],
  ),
  MataKuliah(
    kode: 'PSI010',
    nama: 'Aplikasi Komputer Akuntansi',
    sks: 2,
    dosenPengampu: 'Nelisa, M.Kom',
    kapasitas: 25,
    jadwal: ['Sabtu 08:00 - 09:30'],
  ),

  // ===============================
  // ⚙️ SEMESTER V
  // ===============================
  MataKuliah(
    kode: 'PI020',
    nama: 'Pemrograman Database III',
    sks: 3,
    dosenPengampu: 'Etika Purnamasari, S.T., M.A.P',
    kapasitas: 25,
    jadwal: ['Senin 13:00 - 15:00'],
  ),
  MataKuliah(
    kode: 'PI021',
    nama: 'Desain Sistem Pakar',
    sks: 3,
    dosenPengampu: 'Irfan Sepria Baresi, S.Kom., M.M',
    kapasitas: 25,
    jadwal: ['Selasa 10:00 - 12:00'],
  ),
  MataKuliah(
    kode: 'PI022',
    nama: 'Aplikasi Mobile Program',
    sks: 3,
    dosenPengampu: 'Wahyudin Fadila, S.Kom',
    kapasitas: 25,
    jadwal: ['Rabu 13:00 - 15:15'],
  ),
  MataKuliah(
    kode: 'PTK020',
    nama: 'Teknik Instalasi Jaringan Komputer',
    sks: 3,
    dosenPengampu: 'Syahran, S.T., M.T',
    kapasitas: 25,
    jadwal: ['Kamis 08:00 - 10:15'],
  ),
  MataKuliah(
    kode: 'PTK021',
    nama: 'Teknik Telekomunikasi Seluler',
    sks: 2,
    dosenPengampu: 'Jasman, S.Kom., M.Kom',
    kapasitas: 25,
    jadwal: ['Kamis 10:30 - 11:45'],
  ),
  MataKuliah(
    kode: 'PTK024',
    nama: 'Sistem Embedded',
    sks: 2,
    dosenPengampu: 'Jasman, S.Kom., M.Kom',
    kapasitas: 25,
    jadwal: ['Jumat 08:00 - 09:15'],
  ),

  // ===============================
  // 🧠 SEMESTER VII
  // ===============================
  MataKuliah(
    kode: 'PI025',
    nama: 'Inovasi & Kewirausahaan TI',
    sks: 2,
    dosenPengampu: 'Etika Purnamasari, S.T., M.A.P',
    kapasitas: 25,
    jadwal: ['Senin 08:00 - 09:30'],
  ),
  MataKuliah(
    kode: 'PI026',
    nama: 'Computer Aided Design',
    sks: 3,
    dosenPengampu: 'Iswuri Handayani, M.Kom',
    kapasitas: 25,
    jadwal: ['Selasa 10:00 - 12:00'],
  ),
  MataKuliah(
    kode: 'PTK030',
    nama: 'Keamanan Jaringan Komputer',
    sks: 2,
    dosenPengampu: 'Irvan Al Anshar Junait, S.T',
    kapasitas: 25,
    jadwal: ['Rabu 08:00 - 09:30'],
  ),
  MataKuliah(
    kode: 'PTK031',
    nama: 'Manajemen Proyek Teknik Komputer',
    sks: 3,
    dosenPengampu: 'Jasman, S.Kom., M.Kom',
    kapasitas: 25,
    jadwal: ['Kamis 10:00 - 12:15'],
  ),
  MataKuliah(
    kode: 'PTK032',
    nama: 'Teknologi Desain VLSI',
    sks: 3,
    dosenPengampu: 'Jasman, S.Kom., M.Kom',
    kapasitas: 25,
    jadwal: ['Jumat 13:00 - 15:15'],
  ),
];

/// =======================================================
/// 👩‍🏫 DATA DOSEN (DIPERBAIKI)
/// =======================================================
final List<Dosen> daftarDosen = [
  Dosen(
    nama: 'Rudin, S.Sos., M.Si',
    nidn: '0915107901',
    mataKuliah: daftarMataKuliah
        .where((mk) => mk.dosenPengampu == 'Rudin, S.Sos., M.Si')
        .toList(),
  ),
  Dosen(
    nama: 'Rahmatia, S.E., M.M',
    nidn: '0915107902',
    mataKuliah: daftarMataKuliah
        .where((mk) => mk.dosenPengampu == 'Rahmatia, S.E., M.M')
        .toList(),
  ),
  Dosen(
    nama: 'Iswuri Handayani, M.Kom',
    nidn: '0915107903',
    mataKuliah: daftarMataKuliah
        .where((mk) => mk.dosenPengampu == 'Iswuri Handayani, M.Kom')
        .toList(),
  ),
  Dosen(
    nama: 'Etika Purnamasari, S.T., M.A.P',
    nidn: '0915107904',
    mataKuliah: daftarMataKuliah
        .where((mk) => mk.dosenPengampu == 'Etika Purnamasari, S.T., M.A.P')
        .toList(),
  ),
  Dosen(
    nama: 'Irfan Sepria Baresi, S.Kom., M.M',
    nidn: '0915107905',
    mataKuliah: daftarMataKuliah
        .where((mk) => mk.dosenPengampu == 'Irfan Sepria Baresi, S.Kom., M.M')
        .toList(),
  ),
  Dosen(
    nama: 'Jasman, S.Kom., M.Kom',
    nidn: '0915107906',
    mataKuliah: daftarMataKuliah
        .where((mk) => mk.dosenPengampu == 'Jasman, S.Kom., M.Kom')
        .toList(),
  ),
  Dosen(
    nama: 'Syahran, S.T., M.T',
    nidn: '0915107907',
    mataKuliah: daftarMataKuliah
        .where((mk) => mk.dosenPengampu == 'Syahran, S.T., M.T')
        .toList(),
  ),
  Dosen(
    nama: 'Wahyudin Fadila, S.Kom',
    nidn: '0915107908',
    mataKuliah: daftarMataKuliah
        .where((mk) => mk.dosenPengampu == 'Wahyudin Fadila, S.Kom')
        .toList(),
  ),
  Dosen(
    nama: 'Nelisa, M.Kom',
    nidn: '0915107909',
    mataKuliah: daftarMataKuliah
        .where((mk) => mk.dosenPengampu == 'Nelisa, M.Kom')
        .toList(),
  ),
  Dosen(
    nama: 'Salfin, S.Kom., M.Si',
    nidn: '0915107910',
    mataKuliah: daftarMataKuliah
        .where((mk) => mk.dosenPengampu == 'Salfin, S.Kom., M.Si')
        .toList(),
  ),
  Dosen(
    nama: 'Irvan Al Anshar Junait, S.T',
    nidn: '0915107911',
    mataKuliah: daftarMataKuliah
        .where((mk) => mk.dosenPengampu == 'Irvan Al Anshar Junait, S.T')
        .toList(),
  ),
  Dosen(
    nama: 'Lidya Rahayu Ningrum, S.Si',
    nidn: '0915107912',
    mataKuliah: daftarMataKuliah
        .where((mk) => mk.dosenPengampu == 'Lidya Rahayu Ningrum, S.Si')
        .toList(),
  ),
];


/// =======================================================
/// 🗂️ PEMETAAN PRODI & SEMESTER
/// =======================================================
final Map<String, Map<int, List<MataKuliah>>> daftarMatakuliahPerProdi = {
  'Sistem Informasi': {
    1: daftarMataKuliah.where((mk) => ['PI001', 'PI002', 'PI003', 'PI004', 'PI005', 'PI007', 'PSI001'].contains(mk.kode)).toList(),
    3: daftarMataKuliah.where((mk) => ['PI013', 'PI015', 'PI006', 'PSI010'].contains(mk.kode)).toList(),
    5: daftarMataKuliah.where((mk) => ['PI020', 'PI021', 'PI022'].contains(mk.kode)).toList(),
    7: daftarMataKuliah.where((mk) => ['PI025', 'PI026'].contains(mk.kode)).toList(),
  },
  'Teknik Komputer': {
    1: daftarMataKuliah.where((mk) => ['PI001', 'PI002', 'PI003', 'PI005', 'PI007', 'PTK003', 'PTK022'].contains(mk.kode)).toList(),
    3: daftarMataKuliah.where((mk) => ['PTK011', 'PTK012', 'PTK013', 'PI006'].contains(mk.kode)).toList(),
    5: daftarMataKuliah.where((mk) => ['PTK020', 'PTK021', 'PTK024', 'PI021'].contains(mk.kode)).toList(),
    7: daftarMataKuliah.where((mk) => ['PTK030', 'PTK031', 'PTK032'].contains(mk.kode)).toList(),
  },
};

/// =======================================================
/// 🧾 DATA KRS
/// =======================================================
final List<KRS> daftarKRS = [
  KRS(mahasiswa: daftarMahasiswa[0], mataKuliah: daftarMataKuliah.firstWhere((mk) => mk.kode == 'PI020')),
  KRS(mahasiswa: daftarMahasiswa[0], mataKuliah: daftarMataKuliah.firstWhere((mk) => mk.kode == 'PI021')),
  KRS(mahasiswa: daftarMahasiswa[1], mataKuliah: daftarMataKuliah.firstWhere((mk) => mk.kode == 'PTK020')),
  KRS(mahasiswa: daftarMahasiswa[1], mataKuliah: daftarMataKuliah.firstWhere((mk) => mk.kode == 'PTK021')),
  KRS(mahasiswa: daftarMahasiswa[2], mataKuliah: daftarMataKuliah.firstWhere((mk) => mk.kode == 'PI001')),
  KRS(mahasiswa: daftarMahasiswa[2], mataKuliah: daftarMataKuliah.firstWhere((mk) => mk.kode == 'PI003')),
];

/// =======================================================
/// 🔍 Fungsi bantu: ambil mahasiswa berdasarkan kode MK
/// =======================================================
List<Mahasiswa> getMahasiswaByMataKuliah(String kodeMatkul) {
  return daftarKRS
      .where((krs) => krs.mataKuliah.kode == kodeMatkul)
      .map((krs) => krs.mahasiswa)
      .toList();
}

/// =======================================================
/// 🧩 Fungsi untuk menyimpan nilai dari dosen ke mahasiswa
/// =======================================================
void simpanNilaiDariDosen({
  required String nim,
  required String kodeMK,
  required String namaMK,
  required double angka,
  required String huruf,
}) {
  // Cari mahasiswa berdasarkan NIM
  final mahasiswa = daftarMahasiswa.firstWhere(
    (m) => m.nim == nim,
    orElse: () => throw Exception('Mahasiswa dengan NIM $nim tidak ditemukan'),
  );

  // Tambahkan / perbarui nilai di nilaiSemester
  mahasiswa.nilaiSemester[kodeMK] = Nilai(
    nim: nim,
    kodeMK: kodeMK,
    namaMK: namaMK,
    angka: angka,
    huruf: huruf,
  );

  print('✅ Nilai $namaMK ($kodeMK) disimpan untuk ${mahasiswa.nama}');
}

