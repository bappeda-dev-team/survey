defmodule Survey.Kuesioners.Pertanyaan do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pertanyaans" do
    field :kode_pertanyaan, :string
    field :pertanyaan, :string

    timestamps(type: :utc_datetime)

    belongs_to :nama_data, Survey.Kuesioners.NamaData

    has_many :jawabans, Survey.Respons.Jawaban,
      foreign_key: :kode_pertanyaan,
      references: :kode_pertanyaan
  end

  @doc false
  def changeset(pertanyaan, attrs) do
    pertanyaan
    |> cast(attrs, [:kode_pertanyaan, :pertanyaan, :nama_data_id])
    |> validate_required([:kode_pertanyaan, :pertanyaan, :nama_data_id])
  end

  # defp prefix_kode_pertanyaan(pertanyaan) do
  #   "P-#{pertanyaan.id}"
  # end

  def respon_pertanyaan(%{kode_pertanyaan: kode_pertanyaan}) do
    Survey.Respons.respons(kode_pertanyaan)
  end
end
