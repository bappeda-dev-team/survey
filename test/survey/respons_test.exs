defmodule Survey.ResponsTest do
  use Survey.DataCase

  alias Survey.Respons

  describe "pesertas" do
    alias Survey.Respons.Peserta

    import Survey.ResponsFixtures

    @invalid_attrs %{jenis_id: nil, kode_peserta: nil, nama_peserta: nil, tahun: nil, keterangan: nil}

    test "list_pesertas/0 returns all pesertas" do
      peserta = peserta_fixture()
      assert Respons.list_pesertas() == [peserta]
    end

    test "get_peserta!/1 returns the peserta with given id" do
      peserta = peserta_fixture()
      assert Respons.get_peserta!(peserta.id) == peserta
    end

    test "create_peserta/1 with valid data creates a peserta" do
      valid_attrs = %{jenis_id: "some jenis_id", kode_peserta: "some kode_peserta", nama_peserta: "some nama_peserta", tahun: 42, keterangan: "some keterangan"}

      assert {:ok, %Peserta{} = peserta} = Respons.create_peserta(valid_attrs)
      assert peserta.jenis_id == "some jenis_id"
      assert peserta.kode_peserta == "some kode_peserta"
      assert peserta.nama_peserta == "some nama_peserta"
      assert peserta.tahun == 42
      assert peserta.keterangan == "some keterangan"
    end

    test "create_peserta/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Respons.create_peserta(@invalid_attrs)
    end

    test "update_peserta/2 with valid data updates the peserta" do
      peserta = peserta_fixture()
      update_attrs = %{jenis_id: "some updated jenis_id", kode_peserta: "some updated kode_peserta", nama_peserta: "some updated nama_peserta", tahun: 43, keterangan: "some updated keterangan"}

      assert {:ok, %Peserta{} = peserta} = Respons.update_peserta(peserta, update_attrs)
      assert peserta.jenis_id == "some updated jenis_id"
      assert peserta.kode_peserta == "some updated kode_peserta"
      assert peserta.nama_peserta == "some updated nama_peserta"
      assert peserta.tahun == 43
      assert peserta.keterangan == "some updated keterangan"
    end

    test "update_peserta/2 with invalid data returns error changeset" do
      peserta = peserta_fixture()
      assert {:error, %Ecto.Changeset{}} = Respons.update_peserta(peserta, @invalid_attrs)
      assert peserta == Respons.get_peserta!(peserta.id)
    end

    test "delete_peserta/1 deletes the peserta" do
      peserta = peserta_fixture()
      assert {:ok, %Peserta{}} = Respons.delete_peserta(peserta)
      assert_raise Ecto.NoResultsError, fn -> Respons.get_peserta!(peserta.id) end
    end

    test "change_peserta/1 returns a peserta changeset" do
      peserta = peserta_fixture()
      assert %Ecto.Changeset{} = Respons.change_peserta(peserta)
    end
  end
end
