defmodule Survey.OpdsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Survey.Opds` context.
  """

  @doc """
  Generate a unique opd kode_opd.
  """
  def unique_opd_kode_opd, do: "some kode_opd#{System.unique_integer([:positive])}"

  @doc """
  Generate a unique opd nama_opd.
  """
  def unique_opd_nama_opd, do: "some nama_opd#{System.unique_integer([:positive])}"

  @doc """
  Generate a opd.
  """
  def opd_fixture(attrs \\ %{}) do
    {:ok, opd} =
      attrs
      |> Enum.into(%{
        aktif: true,
        kode_opd: unique_opd_kode_opd(),
        nama_opd: unique_opd_nama_opd()
      })
      |> Survey.Opds.create_opd()

    opd
  end

  @doc """
  Generate a unique urusan kode_urusan.
  """
  def unique_urusan_kode_urusan, do: "some kode_urusan#{System.unique_integer([:positive])}"

  @doc """
  Generate a unique urusan nama_urusan.
  """
  def unique_urusan_nama_urusan, do: "some nama_urusan#{System.unique_integer([:positive])}"

  @doc """
  Generate a urusan.
  """
  def urusan_fixture(attrs \\ %{}) do
    {:ok, urusan} =
      attrs
      |> Enum.into(%{
        aktif: true,
        kode_urusan: unique_urusan_kode_urusan(),
        nama_urusan: unique_urusan_nama_urusan()
      })
      |> Survey.Opds.create_urusan()

    urusan
  end

  @doc """
  Generate a unique bidang_urusan kode_bidang_urusan.
  """
  def unique_bidang_urusan_kode_bidang_urusan, do: "some kode_bidang_urusan#{System.unique_integer([:positive])}"

  @doc """
  Generate a unique bidang_urusan nama_bidang_urusan.
  """
  def unique_bidang_urusan_nama_bidang_urusan, do: "some nama_bidang_urusan#{System.unique_integer([:positive])}"

  @doc """
  Generate a bidang_urusan.
  """
  def bidang_urusan_fixture(attrs \\ %{}) do
    {:ok, bidang_urusan} =
      attrs
      |> Enum.into(%{
        aktif: true,
        kode_bidang_urusan: unique_bidang_urusan_kode_bidang_urusan(),
        nama_bidang_urusan: unique_bidang_urusan_nama_bidang_urusan()
      })
      |> Survey.Opds.create_bidang_urusan()

    bidang_urusan
  end
end
