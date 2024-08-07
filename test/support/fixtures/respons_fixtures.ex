defmodule Survey.ResponsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Survey.Respons` context.
  """

  @doc """
  Generate a peserta.
  """
  def peserta_fixture(attrs \\ %{}) do
    {:ok, peserta} =
      attrs
      |> Enum.into(%{
        jenis_id: "some jenis_id",
        keterangan: "some keterangan",
        kode_peserta: "some kode_peserta",
        nama_peserta: "some nama_peserta",
        tahun: 42
      })
      |> Survey.Respons.create_peserta()

    peserta
  end

  @doc """
  Generate a respon.
  """
  def respon_fixture(attrs \\ %{}) do
    {:ok, respon} =
      attrs
      |> Enum.into(%{
        kode_pertanyaan: "some kode_pertanyaan",
        kode_peserta: "some kode_peserta",
        respon: "some respon"
      })
      |> Survey.Respons.create_respon()

    respon
  end

  @doc """
  Generate a jawaban.
  """
  def jawaban_fixture(attrs \\ %{}) do
    {:ok, jawaban} =
      attrs
      |> Enum.into(%{
        bobot: 120.5,
        jawaban: "some jawaban",
        kode_jawaban: "some kode_jawaban",
        kode_pertanyaan: "some kode_pertanyaan",
        skor: 42
      })
      |> Survey.Respons.create_jawaban()

    jawaban
  end
end
