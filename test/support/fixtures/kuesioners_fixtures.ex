defmodule Survey.KuesionersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Survey.Kuesioners` context.
  """

  @doc """
  Generate a kuesioner.
  """
  def kuesioner_fixture(attrs \\ %{}) do
    {:ok, kuesioner} =
      attrs
      |> Enum.into(%{
        deskripsi: "some deskripsi",
        judul: "some judul",
        penyelenggara: "some penyelenggara",
        tahun: 42
      })
      |> Survey.Kuesioners.create_kuesioner()

    kuesioner
  end

  @doc """
  Generate a nama_data.
  """
  def nama_data_fixture(attrs \\ %{}) do
    {:ok, nama_data} =
      attrs
      |> Enum.into(%{
        keterangan: "some keterangan",
        kode_bidang_urusan: "some kode_bidang_urusan",
        konsep: "some konsep",
        metodologi: "some metodologi",
        nama_data: "some nama_data"
      })
      |> Survey.Kuesioners.create_nama_data()

    nama_data
  end

  @doc """
  Generate a pertanyaan.
  """
  def pertanyaan_fixture(attrs \\ %{}) do
    {:ok, pertanyaan} =
      attrs
      |> Enum.into(%{
        kode_pertanyaan: "some kode_pertanyaan",
        pertanyaan: "some pertanyaan"
      })
      |> Survey.Kuesioners.create_pertanyaan()

    pertanyaan
  end
end
