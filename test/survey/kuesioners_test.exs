defmodule Survey.KuesionersTest do
  use Survey.DataCase

  alias Survey.Kuesioners

  describe "kuesioners" do
    alias Survey.Kuesioners.Kuesioner

    import Survey.KuesionersFixtures

    @invalid_attrs %{judul: nil, penyelenggara: nil, tahun: nil, deskripsi: nil}

    test "list_kuesioners/0 returns all kuesioners" do
      kuesioner = kuesioner_fixture()
      assert Kuesioners.list_kuesioners() == [kuesioner]
    end

    test "get_kuesioner!/1 returns the kuesioner with given id" do
      kuesioner = kuesioner_fixture()
      assert Kuesioners.get_kuesioner!(kuesioner.id) == kuesioner
    end

    test "create_kuesioner/1 with valid data creates a kuesioner" do
      valid_attrs = %{judul: "some judul", penyelenggara: "some penyelenggara", tahun: 42, deskripsi: "some deskripsi"}

      assert {:ok, %Kuesioner{} = kuesioner} = Kuesioners.create_kuesioner(valid_attrs)
      assert kuesioner.judul == "some judul"
      assert kuesioner.penyelenggara == "some penyelenggara"
      assert kuesioner.tahun == 42
      assert kuesioner.deskripsi == "some deskripsi"
    end

    test "create_kuesioner/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Kuesioners.create_kuesioner(@invalid_attrs)
    end

    test "update_kuesioner/2 with valid data updates the kuesioner" do
      kuesioner = kuesioner_fixture()
      update_attrs = %{judul: "some updated judul", penyelenggara: "some updated penyelenggara", tahun: 43, deskripsi: "some updated deskripsi"}

      assert {:ok, %Kuesioner{} = kuesioner} = Kuesioners.update_kuesioner(kuesioner, update_attrs)
      assert kuesioner.judul == "some updated judul"
      assert kuesioner.penyelenggara == "some updated penyelenggara"
      assert kuesioner.tahun == 43
      assert kuesioner.deskripsi == "some updated deskripsi"
    end

    test "update_kuesioner/2 with invalid data returns error changeset" do
      kuesioner = kuesioner_fixture()
      assert {:error, %Ecto.Changeset{}} = Kuesioners.update_kuesioner(kuesioner, @invalid_attrs)
      assert kuesioner == Kuesioners.get_kuesioner!(kuesioner.id)
    end

    test "delete_kuesioner/1 deletes the kuesioner" do
      kuesioner = kuesioner_fixture()
      assert {:ok, %Kuesioner{}} = Kuesioners.delete_kuesioner(kuesioner)
      assert_raise Ecto.NoResultsError, fn -> Kuesioners.get_kuesioner!(kuesioner.id) end
    end

    test "change_kuesioner/1 returns a kuesioner changeset" do
      kuesioner = kuesioner_fixture()
      assert %Ecto.Changeset{} = Kuesioners.change_kuesioner(kuesioner)
    end
  end

  describe "nama_datas" do
    alias Survey.Kuesioners.NamaData

    import Survey.KuesionersFixtures

    @invalid_attrs %{nama_data: nil, konsep: nil, metodologi: nil, kode_bidang_urusan: nil, keterangan: nil}

    test "list_nama_datas/0 returns all nama_datas" do
      nama_data = nama_data_fixture()
      assert Kuesioners.list_nama_datas() == [nama_data]
    end

    test "get_nama_data!/1 returns the nama_data with given id" do
      nama_data = nama_data_fixture()
      assert Kuesioners.get_nama_data!(nama_data.id) == nama_data
    end

    test "create_nama_data/1 with valid data creates a nama_data" do
      valid_attrs = %{nama_data: "some nama_data", konsep: "some konsep", metodologi: "some metodologi", kode_bidang_urusan: "some kode_bidang_urusan", keterangan: "some keterangan"}

      assert {:ok, %NamaData{} = nama_data} = Kuesioners.create_nama_data(valid_attrs)
      assert nama_data.nama_data == "some nama_data"
      assert nama_data.konsep == "some konsep"
      assert nama_data.metodologi == "some metodologi"
      assert nama_data.kode_bidang_urusan == "some kode_bidang_urusan"
      assert nama_data.keterangan == "some keterangan"
    end

    test "create_nama_data/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Kuesioners.create_nama_data(@invalid_attrs)
    end

    test "update_nama_data/2 with valid data updates the nama_data" do
      nama_data = nama_data_fixture()
      update_attrs = %{nama_data: "some updated nama_data", konsep: "some updated konsep", metodologi: "some updated metodologi", kode_bidang_urusan: "some updated kode_bidang_urusan", keterangan: "some updated keterangan"}

      assert {:ok, %NamaData{} = nama_data} = Kuesioners.update_nama_data(nama_data, update_attrs)
      assert nama_data.nama_data == "some updated nama_data"
      assert nama_data.konsep == "some updated konsep"
      assert nama_data.metodologi == "some updated metodologi"
      assert nama_data.kode_bidang_urusan == "some updated kode_bidang_urusan"
      assert nama_data.keterangan == "some updated keterangan"
    end

    test "update_nama_data/2 with invalid data returns error changeset" do
      nama_data = nama_data_fixture()
      assert {:error, %Ecto.Changeset{}} = Kuesioners.update_nama_data(nama_data, @invalid_attrs)
      assert nama_data == Kuesioners.get_nama_data!(nama_data.id)
    end

    test "delete_nama_data/1 deletes the nama_data" do
      nama_data = nama_data_fixture()
      assert {:ok, %NamaData{}} = Kuesioners.delete_nama_data(nama_data)
      assert_raise Ecto.NoResultsError, fn -> Kuesioners.get_nama_data!(nama_data.id) end
    end

    test "change_nama_data/1 returns a nama_data changeset" do
      nama_data = nama_data_fixture()
      assert %Ecto.Changeset{} = Kuesioners.change_nama_data(nama_data)
    end
  end
end
