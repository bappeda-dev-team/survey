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
end
