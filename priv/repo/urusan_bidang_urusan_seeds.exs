alias Survey.Repo
alias Survey.Opds.Urusan
alias Survey.Opds.BidangUrusan

urusans = [
  %Urusan{
    kode_urusan: "1",
    nama_urusan: "URUSAN PEMERINTAHAN WAJIB YANG BERKAITAN DENGAN PELAYANAN DASAR",
    aktif: true
  },
  %Urusan{
    kode_urusan: "2",
    nama_urusan: "URUSAN PEMERINTAHAN WAJIB YANG TIDAK BERKAITAN DENGAN PELAYANAN DASAR",
    aktif: true
  },
  %Urusan{
    kode_urusan: "3",
    nama_urusan: "URUSAN PEMERINTAHAN PILIHAN",
    aktif: true
  },
  %Urusan{
    kode_urusan: "4",
    nama_urusan: "UNSUR PENDUKUNG URUSAN PEMERINTAHAN",
    aktif: true
  },
  %Urusan{
    kode_urusan: "5",
    nama_urusan: "UNSUR PENUNJANG URUSAN PEMERINTAHAN",
    aktif: true
  },
  %Urusan{
    kode_urusan: "6",
    nama_urusan: "UNSUR PENGAWASAN URUSAN PEMERINTAHAN",
    aktif: true
  },
  %Urusan{
    kode_urusan: "7",
    nama_urusan: "UNSUR KEWILAYAHAN",
    aktif: true
  },
  %Urusan{
    kode_urusan: "8",
    nama_urusan: "UNSUR PEMERINTAHAN UMUM",
    aktif: true
  },
  %Urusan{
    kode_urusan: "9",
    nama_urusan: "UNSUR KEKHUSUSAN DAN KEISTIMEWAAN",
    aktif: true
  },
  %Urusan{
    kode_urusan: "X",
    nama_urusan: "UNSUR PENUNJANG",
    aktif: true
  }
]

Enum.each(urusans, fn urusan ->
  Repo.insert!(urusan)
end)

bidang_urusans = [
  %BidangUrusan{
    kode_urusan: "1",
    kode_bidang_urusan: "1.01",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG PENDIDIKAN",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "1",
    kode_bidang_urusan: "1.02",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG KESEHATAN",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "1",
    kode_bidang_urusan: "1.03",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG PEKERJAAN UMUM DAN PENATAAN RUANG",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "1",
    kode_bidang_urusan: "1.04",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG PERUMAHAN DAN KAWASAN PERMUKIMAN",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "1",
    kode_bidang_urusan: "1.05",
    nama_bidang_urusan:
      "URUSAN PEMERINTAHAN BIDANG KETENTERAMAN DAN KETERTIBAN UMUM SERTA PERLINDUNGAN MASYARAKAT",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "1",
    kode_bidang_urusan: "1.06",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG SOSIAL",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "2",
    kode_bidang_urusan: "2.07",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG TENAGA KERJA",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "2",
    kode_bidang_urusan: "2.08",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG PEMBERDAYAAN PEREMPUAN DAN PERLINDUNGAN ANAK",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "2",
    kode_bidang_urusan: "2.09",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG PANGAN",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "2",
    kode_bidang_urusan: "2.10",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG PERTANAHAN",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "2",
    kode_bidang_urusan: "2.11",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG LINGKUNGAN HIDUP",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "2",
    kode_bidang_urusan: "2.12",
    nama_bidang_urusan:
      "URUSAN PEMERINTAHAN BIDANG ADMINISTRASI KEPENDUDUKAN DAN PENCATATAN SIPIL",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "2",
    kode_bidang_urusan: "2.13",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG PEMBERDAYAAN MASYARAKAT DAN DESA",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "2",
    kode_bidang_urusan: "2.14",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG PENGENDALIAN PENDUDUK DAN KELUARGA BERENCANA",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "2",
    kode_bidang_urusan: "2.15",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG PERHUBUNGAN",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "2",
    kode_bidang_urusan: "2.16",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG KOMUNIKASI DAN INFORMATIKA",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "2",
    kode_bidang_urusan: "2.17",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG KOPERASI, USAHA KECIL, DAN MENENGAH",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "2",
    kode_bidang_urusan: "2.18",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG PENANAMAN MODAL",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "2",
    kode_bidang_urusan: "2.19",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG KEPEMUDAAN DAN OLAHRAGA",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "2",
    kode_bidang_urusan: "2.20",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG STATISTIK",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "2",
    kode_bidang_urusan: "2.21",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG PERSANDIAN",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "2",
    kode_bidang_urusan: "2.22",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG KEBUDAYAAN",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "2",
    kode_bidang_urusan: "2.23",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG PERPUSTAKAAN",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "2",
    kode_bidang_urusan: "2.24",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG KEARSIPAN",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "3",
    kode_bidang_urusan: "3.25",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG KELAUTAN DAN PERIKANAN",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "3",
    kode_bidang_urusan: "3.26",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG PARIWISATA",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "3",
    kode_bidang_urusan: "3.27",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG PERTANIAN",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "3",
    kode_bidang_urusan: "3.28",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG KEHUTANAN",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "3",
    kode_bidang_urusan: "3.29",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG ENERGI DAN SUMBER DAYA MINERAL",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "3",
    kode_bidang_urusan: "3.30",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG PERDAGANGAN",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "3",
    kode_bidang_urusan: "3.31",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG PERINDUSTRIAN",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "3",
    kode_bidang_urusan: "3.32",
    nama_bidang_urusan: "URUSAN PEMERINTAHAN BIDANG TRANSMIGRASI",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "4",
    kode_bidang_urusan: "4.01",
    nama_bidang_urusan: "SEKRETARIAT DAERAH",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "4",
    kode_bidang_urusan: "4.02",
    nama_bidang_urusan: "SEKRETARIAT DPRD",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "5",
    kode_bidang_urusan: "5.01",
    nama_bidang_urusan: "PERENCANAAN",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "5",
    kode_bidang_urusan: "5.02",
    nama_bidang_urusan: "KEUANGAN",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "5",
    kode_bidang_urusan: "5.03",
    nama_bidang_urusan: "KEPEGAWAIAN",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "5",
    kode_bidang_urusan: "5.04",
    nama_bidang_urusan: "PENDIDIKAN DAN PELATIHAN",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "5",
    kode_bidang_urusan: "5.05",
    nama_bidang_urusan: "PENELITIAN DAN PENGEMBANGAN",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "5",
    kode_bidang_urusan: "5.06",
    nama_bidang_urusan: "PENGELOLAAN PERBATASAN",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "5",
    kode_bidang_urusan: "5.07",
    nama_bidang_urusan: "PENGELOLAAN PENGHUBUNG",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "6",
    kode_bidang_urusan: "6.01",
    nama_bidang_urusan: "INSPEKTORAT DAERAH",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "7",
    kode_bidang_urusan: "7.01",
    nama_bidang_urusan: "KECAMATAN",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "8",
    kode_bidang_urusan: "8.01",
    nama_bidang_urusan: "KESATUAN BANGSA DAN POLITIK",
    aktif: true
  },
  %BidangUrusan{
    kode_urusan: "X",
    kode_bidang_urusan: "X.XX",
    nama_bidang_urusan: "UNSUR PENUNJANG URUSAN PEMERINTAHAN",
    aktif: true
  }
]

Enum.each(bidang_urusans, fn bidang_urusan ->
  Repo.insert!(bidang_urusan)
end)
