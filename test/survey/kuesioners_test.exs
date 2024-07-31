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
end
