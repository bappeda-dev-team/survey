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
end
