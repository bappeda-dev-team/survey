alias Survey.Repo
alias Survey.Opds.Opd

Repo.insert!(%Opd{
  nama_opd: "Badan Perencanaan, Penelitian dan Pengembangan Daerah",
  kode_opd: "5.01.5.05.0.00.02.0000",
  aktif: true
})

Repo.insert!(%Opd{
  nama_opd: "Dinas Sosial, Pemberdayaan Perempuan dan Perlindungan Anak",
  kode_opd: "1.06.2.08.0.00.02.0000",
  aktif: true
})

Repo.insert!(%Opd{
  nama_opd: "Dinas Kesehatan, Pengendalian Penduduk dan Keluarga Berencana",
  kode_opd: "1.02.2.14.0.00.03.0000",
  aktif: true
})
