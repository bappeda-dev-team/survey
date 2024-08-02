alias Survey.Repo
alias Survey.Opds.Urusan
alias Survey.Opds.BidangUrusan
alias Survey.Kuesioners.Kuesioner
alias Survey.Kuesioners.NamaData
alias Survey.Kuesioners.Pertanyaan

urusan = %Urusan{
  kode_urusan: "D",
  nama_urusan: "INTERNAL DATA",
  aktif: true,
  bidang_urusans: [
    %BidangUrusan{
      kode_urusan: "D",
      kode_bidang_urusan: "D.01",
      nama_bidang_urusan: "DATA PERSONIL",
      aktif: true
    },
    %BidangUrusan{
      kode_urusan: "D",
      kode_bidang_urusan: "D.02",
      nama_bidang_urusan: "PENGHASILAN",
      aktif: true
    },
    %BidangUrusan{
      kode_urusan: "D",
      kode_bidang_urusan: "D.03",
      nama_bidang_urusan: "KEPEMILIKAN ASET",
      aktif: true
    },
    %BidangUrusan{
      kode_urusan: "D",
      kode_bidang_urusan: "D.04",
      nama_bidang_urusan: "PENGELUARAN",
      aktif: true
    }
  ]
}

Repo.insert!(urusan)

kuesioners = [
  %Kuesioner{
    judul: "Regsosek",
    penyelenggara: "BPS",
    tahun: 2022,
    deskripsi: "Registrasi Sosial Ekonomi (Regsosek)
    adalah pengumpulan data seluruh penduduk yang terdiri atas profil,
    kondisi sosial, ekonomi, dan tingkat kesejahteraan.
    Data Regsosek akan menjembatani koordinasi dan
    berbagi pakai data lintas lembaga dan lintas daerah
    untuk memastikan pemakaian data yang konsisten
    karena terhubung dengan data induk kependudukan
    serta basis data lainnya hingga tingkat desa/kelurahan."
  }
]

nama_datas = [
  %NamaData{
    nama_data: "Data Kartu Keluarga",
    konsep: "-",
    metodologi: "-",
    kode_bidang_urusan: "D.01",
    keterangan: "-",
    tahun: 2022,
    pertanyaans: [
      %Pertanyaan{
        kode_pertanyaan: "D.01.01",
        pertanyaan: "Kepala Keluarga"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.02",
        pertanyaan: "Istri"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.03",
        pertanyaan: "Jumlah anak"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.04",
        pertanyaan: "Informasi elemen data kependudukan"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.05",
        pertanyaan: "Jumlah Anggota Keluarga yang menjadi tanggungan"
      }
    ]
  },
  %NamaData{
    nama_data: "Data Kependudukan/ Anggota Rumah Tangga",
    konsep: "-",
    metodologi: "-",
    kode_bidang_urusan: "D.01",
    keterangan: "-",
    tahun: 2022,
    pertanyaans: [
      %Pertanyaan{
        kode_pertanyaan: "D.01.06",
        pertanyaan: "NIK"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.07",
        pertanyaan: "No.KK"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.08",
        pertanyaan: "Nama Lengkap"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.09",
        pertanyaan: "Jenis Kelamin"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.10",
        pertanyaan: "Tempat Lahir"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.11",
        pertanyaan: "Tanggal Lahir"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.12",
        pertanyaan: "Pekerjaan"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.13",
        pertanyaan: "Agama/Kepercayaan"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.14",
        pertanyaan: "Status hubungan dalam keluarga"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.15",
        pertanyaan: "Status Perkawinan"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.16",
        pertanyaan: "Kewarganegaraan"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.17",
        pertanyaan: "Nama ibu"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.18",
        pertanyaan: "NIK ayah"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.19",
        pertanyaan: "Nama Ayah"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.20",
        pertanyaan: "Golongan Darah"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.21",
        pertanyaan: "cacat fisik dan/mental"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.22",
        pertanyaan: "pendidikan terakhir"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.23",
        pertanyaan: "alamat sebelumnya"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.24",
        pertanyaan: "alamat sekarang"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.25",
        pertanyaan: "alamat domisili"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.26",
        pertanyaan: "kepemilikan akta kelahiran/surat kenal lahir"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.27",
        pertanyaan: "nomor akta kelahiran/nomor surat kenal lahir"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.28",
        pertanyaan: "kepemilikan akta perkawinan/buku nikah"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.29",
        pertanyaan: "nomor akta perkawinan/buku nikah"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.30",
        pertanyaan: "tanggal perkawinan"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.31",
        pertanyaan: "kepemilikan akta perceraian"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.32",
        pertanyaan: "nomor akta perceraian/surat cerai"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.33",
        pertanyaan: "tanggal perceraian"
      }
    ]
  },
  %NamaData{
    nama_data: "Kondisi Khusus",
    konsep: "-",
    metodologi: "-",
    kode_bidang_urusan: "D.01",
    keterangan: "-",
    tahun: 2022,
    pertanyaans: [
      %Pertanyaan{
        kode_pertanyaan: "D.01.34",
        pertanyaan: "KESEHATAN"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.01.35",
        pertanyaan: "PENDIDIKAN ANAK"
      }
    ]
  },
  %NamaData{
    nama_data: "Jenis Pekerjaan",
    konsep: "-",
    metodologi: "-",
    kode_bidang_urusan: "D.02",
    keterangan: "-",
    tahun: 2022,
    pertanyaans: [
      %Pertanyaan{
        kode_pertanyaan: "D.02.01",
        pertanyaan: "PNS/TNI/POLRI/ Pegawai BUMN"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.02.02",
        pertanyaan: "Wiraswasta"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.02.03",
        pertanyaan: "Pensiunan"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.02.04",
        pertanyaan: "Buruh"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.02.05",
        pertanyaan: "Tidak Bekerja"
      }
    ]
  },
  %NamaData{
    nama_data: "Kepemilikan Aset",
    konsep: "-",
    metodologi: "-",
    kode_bidang_urusan: "D.03",
    keterangan: "-",
    tahun: 2022,
    pertanyaans: [
      %Pertanyaan{
        kode_pertanyaan: "D.03.01",
        pertanyaan: "Tempat Tinggal"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.03.02",
        pertanyaan: "Kendaraan"
      }
    ]
  },
  %NamaData{
    nama_data: "Kebutuhan Dasar",
    konsep: "-",
    metodologi: "-",
    kode_bidang_urusan: "D.04",
    keterangan: "-",
    tahun: 2022,
    pertanyaans: [
      %Pertanyaan{
        kode_pertanyaan: "D.04.01",
        pertanyaan: "Listrik (Daya)"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.04.02",
        pertanyaan: "Komunikasi"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.04.03",
        pertanyaan: "Air Minum"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.04.04",
        pertanyaan: "Penggunaan Gas"
      },
      %Pertanyaan{
        kode_pertanyaan: "D.04.05",
        pertanyaan: "Asuransi Kesehatan"
      }
    ]
  }
]

Enum.each(kuesioners, fn kuesioner ->
  Repo.insert!(kuesioner)
end)

Enum.each(nama_datas, fn data ->
  Repo.insert!(data)
end)
