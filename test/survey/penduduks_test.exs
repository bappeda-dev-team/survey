defmodule Survey.PenduduksTest do
  use Survey.DataCase

  alias Survey.Penduduks

  describe "penduduks" do
    alias Survey.Penduduks.Penduduk

    import Survey.PenduduksFixtures

    @invalid_attrs %{kode_unik: nil, nik: nil, nokk: nil, nama: nil, tanggal_lahir: nil, jenis_kelamin: nil, kelurahan: nil, kecamatan: nil, kota_kab: nil, rt: nil, rw: nil}

    test "list_penduduks/0 returns all penduduks" do
      penduduk = penduduk_fixture()
      assert Penduduks.list_penduduks() == [penduduk]
    end

    test "get_penduduk!/1 returns the penduduk with given id" do
      penduduk = penduduk_fixture()
      assert Penduduks.get_penduduk!(penduduk.id) == penduduk
    end

    test "create_penduduk/1 with valid data creates a penduduk" do
      valid_attrs = %{kode_unik: "some kode_unik", nik: "some nik", nokk: "some nokk", nama: "some nama", tanggal_lahir: ~D[2024-07-28], jenis_kelamin: "some jenis_kelamin", kelurahan: "some kelurahan", kecamatan: "some kecamatan", kota_kab: "some kota_kab", rt: "some rt", rw: "some rw"}

      assert {:ok, %Penduduk{} = penduduk} = Penduduks.create_penduduk(valid_attrs)
      assert penduduk.kode_unik == "some kode_unik"
      assert penduduk.nik == "some nik"
      assert penduduk.nokk == "some nokk"
      assert penduduk.nama == "some nama"
      assert penduduk.tanggal_lahir == ~D[2024-07-28]
      assert penduduk.jenis_kelamin == "some jenis_kelamin"
      assert penduduk.kelurahan == "some kelurahan"
      assert penduduk.kecamatan == "some kecamatan"
      assert penduduk.kota_kab == "some kota_kab"
      assert penduduk.rt == "some rt"
      assert penduduk.rw == "some rw"
    end

    test "create_penduduk/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Penduduks.create_penduduk(@invalid_attrs)
    end

    test "update_penduduk/2 with valid data updates the penduduk" do
      penduduk = penduduk_fixture()
      update_attrs = %{kode_unik: "some updated kode_unik", nik: "some updated nik", nokk: "some updated nokk", nama: "some updated nama", tanggal_lahir: ~D[2024-07-29], jenis_kelamin: "some updated jenis_kelamin", kelurahan: "some updated kelurahan", kecamatan: "some updated kecamatan", kota_kab: "some updated kota_kab", rt: "some updated rt", rw: "some updated rw"}

      assert {:ok, %Penduduk{} = penduduk} = Penduduks.update_penduduk(penduduk, update_attrs)
      assert penduduk.kode_unik == "some updated kode_unik"
      assert penduduk.nik == "some updated nik"
      assert penduduk.nokk == "some updated nokk"
      assert penduduk.nama == "some updated nama"
      assert penduduk.tanggal_lahir == ~D[2024-07-29]
      assert penduduk.jenis_kelamin == "some updated jenis_kelamin"
      assert penduduk.kelurahan == "some updated kelurahan"
      assert penduduk.kecamatan == "some updated kecamatan"
      assert penduduk.kota_kab == "some updated kota_kab"
      assert penduduk.rt == "some updated rt"
      assert penduduk.rw == "some updated rw"
    end

    test "update_penduduk/2 with invalid data returns error changeset" do
      penduduk = penduduk_fixture()
      assert {:error, %Ecto.Changeset{}} = Penduduks.update_penduduk(penduduk, @invalid_attrs)
      assert penduduk == Penduduks.get_penduduk!(penduduk.id)
    end

    test "delete_penduduk/1 deletes the penduduk" do
      penduduk = penduduk_fixture()
      assert {:ok, %Penduduk{}} = Penduduks.delete_penduduk(penduduk)
      assert_raise Ecto.NoResultsError, fn -> Penduduks.get_penduduk!(penduduk.id) end
    end

    test "change_penduduk/1 returns a penduduk changeset" do
      penduduk = penduduk_fixture()
      assert %Ecto.Changeset{} = Penduduks.change_penduduk(penduduk)
    end
  end
end
