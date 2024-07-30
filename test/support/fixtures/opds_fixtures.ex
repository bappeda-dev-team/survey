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
end
