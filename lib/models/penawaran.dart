enum StatusPenawaran { pending, enrolled, waitlist, rejected }

class Penawaran {
  final String kodeMK;
  final String namaMK;
  final String nim;
  final String namaMahasiswa;
  final String dosen;
  StatusPenawaran status;
  DateTime waktu;
  int posisiWaitlist;

  Penawaran({
    required this.kodeMK,
    required this.namaMK,
    required this.nim,
    required this.namaMahasiswa,
    required this.dosen,
    this.status = StatusPenawaran.pending,
    DateTime? waktu,
    this.posisiWaitlist = 0,
  }) : waktu = waktu ?? DateTime.now();
}
