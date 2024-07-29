# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Survey.Repo.insert!(%Survey.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Survey.Repo
alias Survey.Penduduks.Penduduk

Repo.insert!(%Penduduk{
  kode_unik: "6F82DB5F-BAA9-4475-8254-07721449B31F11",
  nama: "WANINDRANI DEWI PRASETIJAWATI",
  nik: "3577036401670002",
  tanggal_lahir: ~D[1967-1-24],
  jenis_kelamin: "Perempuan",
  kelurahan: "REJOMULYO",
  kecamatan: "TAMAN",
  kota_kab: "Kota Madiun",
  rt: "-",
  rw: "-"
})

Repo.insert!(%Penduduk{
  kode_unik: "8A1912F6-A270-446C-B76B-ABDD9C6513D244",
  nama: "DIDIK SUPRIYADI",
  nik: "3577013105980002",
  tanggal_lahir: ~D[1998-5-31],
  jenis_kelamin: "Laki-laki",
  kelurahan: "REJOMULYO",
  kecamatan: "KARTOHARJO",
  kota_kab: "Kota Madiun",
  rt: "-",
  rw: "-"
})

Repo.insert!(%Penduduk{
  kode_unik: "B0A1C6CD-888F-4226-88A8-E9BA03D1DE1833",
  nama: "ANOI DWI DANCESTU",
  nik: "3577011004000001",
  tanggal_lahir: ~D[2000-4-10],
  jenis_kelamin: "Laki-laki",
  kelurahan: "KEJURON",
  kecamatan: "TAMAN",
  kota_kab: "Kota Madiun",
  rt: "-",
  rw: "-"
})
