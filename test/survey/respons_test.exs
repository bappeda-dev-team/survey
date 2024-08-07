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

  describe "respons" do
    alias Survey.Respons.Respon

    import Survey.ResponsFixtures

    @invalid_attrs %{kode_peserta: nil, kode_pertanyaan: nil, respon: nil}

    test "list_respons/0 returns all respons" do
      respon = respon_fixture()
      assert Respons.list_respons() == [respon]
    end

    test "get_respon!/1 returns the respon with given id" do
      respon = respon_fixture()
      assert Respons.get_respon!(respon.id) == respon
    end

    test "create_respon/1 with valid data creates a respon" do
      valid_attrs = %{kode_peserta: "some kode_peserta", kode_pertanyaan: "some kode_pertanyaan", respon: "some respon"}

      assert {:ok, %Respon{} = respon} = Respons.create_respon(valid_attrs)
      assert respon.kode_peserta == "some kode_peserta"
      assert respon.kode_pertanyaan == "some kode_pertanyaan"
      assert respon.respon == "some respon"
    end

    test "create_respon/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Respons.create_respon(@invalid_attrs)
    end

    test "update_respon/2 with valid data updates the respon" do
      respon = respon_fixture()
      update_attrs = %{kode_peserta: "some updated kode_peserta", kode_pertanyaan: "some updated kode_pertanyaan", respon: "some updated respon"}

      assert {:ok, %Respon{} = respon} = Respons.update_respon(respon, update_attrs)
      assert respon.kode_peserta == "some updated kode_peserta"
      assert respon.kode_pertanyaan == "some updated kode_pertanyaan"
      assert respon.respon == "some updated respon"
    end

    test "update_respon/2 with invalid data returns error changeset" do
      respon = respon_fixture()
      assert {:error, %Ecto.Changeset{}} = Respons.update_respon(respon, @invalid_attrs)
      assert respon == Respons.get_respon!(respon.id)
    end

    test "delete_respon/1 deletes the respon" do
      respon = respon_fixture()
      assert {:ok, %Respon{}} = Respons.delete_respon(respon)
      assert_raise Ecto.NoResultsError, fn -> Respons.get_respon!(respon.id) end
    end

    test "change_respon/1 returns a respon changeset" do
      respon = respon_fixture()
      assert %Ecto.Changeset{} = Respons.change_respon(respon)
    end
  end

  describe "jawabans" do
    alias Survey.Respons.Jawaban

    import Survey.ResponsFixtures

    @invalid_attrs %{kode_pertanyaan: nil, kode_jawaban: nil, jawaban: nil, skor: nil, bobot: nil}

    test "list_jawabans/0 returns all jawabans" do
      jawaban = jawaban_fixture()
      assert Respons.list_jawabans() == [jawaban]
    end

    test "get_jawaban!/1 returns the jawaban with given id" do
      jawaban = jawaban_fixture()
      assert Respons.get_jawaban!(jawaban.id) == jawaban
    end

    test "create_jawaban/1 with valid data creates a jawaban" do
      valid_attrs = %{kode_pertanyaan: "some kode_pertanyaan", kode_jawaban: "some kode_jawaban", jawaban: "some jawaban", skor: 42, bobot: 120.5}

      assert {:ok, %Jawaban{} = jawaban} = Respons.create_jawaban(valid_attrs)
      assert jawaban.kode_pertanyaan == "some kode_pertanyaan"
      assert jawaban.kode_jawaban == "some kode_jawaban"
      assert jawaban.jawaban == "some jawaban"
      assert jawaban.skor == 42
      assert jawaban.bobot == 120.5
    end

    test "create_jawaban/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Respons.create_jawaban(@invalid_attrs)
    end

    test "update_jawaban/2 with valid data updates the jawaban" do
      jawaban = jawaban_fixture()
      update_attrs = %{kode_pertanyaan: "some updated kode_pertanyaan", kode_jawaban: "some updated kode_jawaban", jawaban: "some updated jawaban", skor: 43, bobot: 456.7}

      assert {:ok, %Jawaban{} = jawaban} = Respons.update_jawaban(jawaban, update_attrs)
      assert jawaban.kode_pertanyaan == "some updated kode_pertanyaan"
      assert jawaban.kode_jawaban == "some updated kode_jawaban"
      assert jawaban.jawaban == "some updated jawaban"
      assert jawaban.skor == 43
      assert jawaban.bobot == 456.7
    end

    test "update_jawaban/2 with invalid data returns error changeset" do
      jawaban = jawaban_fixture()
      assert {:error, %Ecto.Changeset{}} = Respons.update_jawaban(jawaban, @invalid_attrs)
      assert jawaban == Respons.get_jawaban!(jawaban.id)
    end

    test "delete_jawaban/1 deletes the jawaban" do
      jawaban = jawaban_fixture()
      assert {:ok, %Jawaban{}} = Respons.delete_jawaban(jawaban)
      assert_raise Ecto.NoResultsError, fn -> Respons.get_jawaban!(jawaban.id) end
    end

    test "change_jawaban/1 returns a jawaban changeset" do
      jawaban = jawaban_fixture()
      assert %Ecto.Changeset{} = Respons.change_jawaban(jawaban)
    end
  end
end
