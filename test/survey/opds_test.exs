defmodule Survey.OpdsTest do
  use Survey.DataCase

  alias Survey.Opds

  describe "opds" do
    alias Survey.Opds.Opd

    import Survey.OpdsFixtures

    @invalid_attrs %{nama_opd: nil, kode_opd: nil, aktif: nil}

    test "list_opds/0 returns all opds" do
      opd = opd_fixture()
      assert Opds.list_opds() == [opd]
    end

    test "get_opd!/1 returns the opd with given id" do
      opd = opd_fixture()
      assert Opds.get_opd!(opd.id) == opd
    end

    test "create_opd/1 with valid data creates a opd" do
      valid_attrs = %{nama_opd: "some nama_opd", kode_opd: "some kode_opd", aktif: true}

      assert {:ok, %Opd{} = opd} = Opds.create_opd(valid_attrs)
      assert opd.nama_opd == "some nama_opd"
      assert opd.kode_opd == "some kode_opd"
      assert opd.aktif == true
    end

    test "create_opd/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Opds.create_opd(@invalid_attrs)
    end

    test "update_opd/2 with valid data updates the opd" do
      opd = opd_fixture()

      update_attrs = %{
        nama_opd: "some updated nama_opd",
        kode_opd: "some updated kode_opd",
        aktif: false
      }

      assert {:ok, %Opd{} = opd} = Opds.update_opd(opd, update_attrs)
      assert opd.nama_opd == "some updated nama_opd"
      assert opd.kode_opd == "some updated kode_opd"
      assert opd.aktif == true
    end

    test "update_opd/2 with invalid data returns error changeset" do
      opd = opd_fixture()
      assert {:error, %Ecto.Changeset{}} = Opds.update_opd(opd, @invalid_attrs)
      assert opd == Opds.get_opd!(opd.id)
    end

    test "delete_opd/1 deletes the opd" do
      opd = opd_fixture()
      assert {:ok, %Opd{}} = Opds.delete_opd(opd)
      assert_raise Ecto.NoResultsError, fn -> Opds.get_opd!(opd.id) end
    end

    test "change_opd/1 returns a opd changeset" do
      opd = opd_fixture()
      assert %Ecto.Changeset{} = Opds.change_opd(opd)
    end
  end

  describe "urusans" do
    alias Survey.Opds.Urusan

    import Survey.OpdsFixtures

    @invalid_attrs %{kode_urusan: nil, nama_urusan: nil, aktif: nil}

    test "list_urusans/0 returns all urusans" do
      urusan = urusan_fixture()
      assert Opds.list_urusans() == [urusan]
    end

    test "get_urusan!/1 returns the urusan with given id" do
      urusan = urusan_fixture()
      assert Opds.get_urusan!(urusan.id) == urusan
    end

    test "create_urusan/1 with valid data creates a urusan" do
      valid_attrs = %{kode_urusan: "some kode_urusan", nama_urusan: "some nama_urusan", aktif: true}

      assert {:ok, %Urusan{} = urusan} = Opds.create_urusan(valid_attrs)
      assert urusan.kode_urusan == "some kode_urusan"
      assert urusan.nama_urusan == "some nama_urusan"
      assert urusan.aktif == true
    end

    test "create_urusan/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Opds.create_urusan(@invalid_attrs)
    end

    test "update_urusan/2 with valid data updates the urusan" do
      urusan = urusan_fixture()
      update_attrs = %{kode_urusan: "some updated kode_urusan", nama_urusan: "some updated nama_urusan", aktif: false}

      assert {:ok, %Urusan{} = urusan} = Opds.update_urusan(urusan, update_attrs)
      assert urusan.kode_urusan == "some updated kode_urusan"
      assert urusan.nama_urusan == "some updated nama_urusan"
      assert urusan.aktif == false
    end

    test "update_urusan/2 with invalid data returns error changeset" do
      urusan = urusan_fixture()
      assert {:error, %Ecto.Changeset{}} = Opds.update_urusan(urusan, @invalid_attrs)
      assert urusan == Opds.get_urusan!(urusan.id)
    end

    test "delete_urusan/1 deletes the urusan" do
      urusan = urusan_fixture()
      assert {:ok, %Urusan{}} = Opds.delete_urusan(urusan)
      assert_raise Ecto.NoResultsError, fn -> Opds.get_urusan!(urusan.id) end
    end

    test "change_urusan/1 returns a urusan changeset" do
      urusan = urusan_fixture()
      assert %Ecto.Changeset{} = Opds.change_urusan(urusan)
    end
  end

  describe "bidang_urusans" do
    alias Survey.Opds.BidangUrusan

    import Survey.OpdsFixtures

    @invalid_attrs %{kode_bidang_urusan: nil, nama_bidang_urusan: nil, aktif: nil}

    test "list_bidang_urusans/0 returns all bidang_urusans" do
      bidang_urusan = bidang_urusan_fixture()
      assert Opds.list_bidang_urusans() == [bidang_urusan]
    end

    test "get_bidang_urusan!/1 returns the bidang_urusan with given id" do
      bidang_urusan = bidang_urusan_fixture()
      assert Opds.get_bidang_urusan!(bidang_urusan.id) == bidang_urusan
    end

    test "create_bidang_urusan/1 with valid data creates a bidang_urusan" do
      valid_attrs = %{kode_bidang_urusan: "some kode_bidang_urusan", nama_bidang_urusan: "some nama_bidang_urusan", aktif: true}

      assert {:ok, %BidangUrusan{} = bidang_urusan} = Opds.create_bidang_urusan(valid_attrs)
      assert bidang_urusan.kode_bidang_urusan == "some kode_bidang_urusan"
      assert bidang_urusan.nama_bidang_urusan == "some nama_bidang_urusan"
      assert bidang_urusan.aktif == true
    end

    test "create_bidang_urusan/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Opds.create_bidang_urusan(@invalid_attrs)
    end

    test "update_bidang_urusan/2 with valid data updates the bidang_urusan" do
      bidang_urusan = bidang_urusan_fixture()
      update_attrs = %{kode_bidang_urusan: "some updated kode_bidang_urusan", nama_bidang_urusan: "some updated nama_bidang_urusan", aktif: false}

      assert {:ok, %BidangUrusan{} = bidang_urusan} = Opds.update_bidang_urusan(bidang_urusan, update_attrs)
      assert bidang_urusan.kode_bidang_urusan == "some updated kode_bidang_urusan"
      assert bidang_urusan.nama_bidang_urusan == "some updated nama_bidang_urusan"
      assert bidang_urusan.aktif == false
    end

    test "update_bidang_urusan/2 with invalid data returns error changeset" do
      bidang_urusan = bidang_urusan_fixture()
      assert {:error, %Ecto.Changeset{}} = Opds.update_bidang_urusan(bidang_urusan, @invalid_attrs)
      assert bidang_urusan == Opds.get_bidang_urusan!(bidang_urusan.id)
    end

    test "delete_bidang_urusan/1 deletes the bidang_urusan" do
      bidang_urusan = bidang_urusan_fixture()
      assert {:ok, %BidangUrusan{}} = Opds.delete_bidang_urusan(bidang_urusan)
      assert_raise Ecto.NoResultsError, fn -> Opds.get_bidang_urusan!(bidang_urusan.id) end
    end

    test "change_bidang_urusan/1 returns a bidang_urusan changeset" do
      bidang_urusan = bidang_urusan_fixture()
      assert %Ecto.Changeset{} = Opds.change_bidang_urusan(bidang_urusan)
    end
  end
end
