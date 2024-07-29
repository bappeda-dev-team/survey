defmodule Survey.PenduduksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Survey.Penduduks` context.
  """

  @doc """
  Generate a penduduk.
  """
  def penduduk_fixture(attrs \\ %{}) do
    {:ok, penduduk} =
      attrs
      |> Enum.into(%{
        jenis_kelamin: "some jenis_kelamin",
        kecamatan: "some kecamatan",
        kelurahan: "some kelurahan",
        kode_unik: "some kode_unik",
        kota_kab: "some kota_kab",
        nama: "some nama",
        nik: "some nik",
        nokk: "some nokk",
        rt: "some rt",
        rw: "some rw",
        tanggal_lahir: ~D[2024-07-28]
      })
      |> Survey.Penduduks.create_penduduk()

    penduduk
  end
end
