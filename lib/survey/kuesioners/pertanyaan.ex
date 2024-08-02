defmodule Survey.Kuesioners.Pertanyaan do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pertanyaans" do
    field :kode_pertanyaan, :string
    field :pertanyaan, :string

    timestamps(type: :utc_datetime)

    belongs_to :nama_data, Survey.Kuesioners.NamaData
  end

  @doc false
  def changeset(pertanyaan, attrs) do
    pertanyaan
    |> cast(attrs, [:kode_pertanyaan, :pertanyaan, :nama_data_id])
    |> validate_required([:kode_pertanyaan, :pertanyaan, :nama_data_id])
  end
end
