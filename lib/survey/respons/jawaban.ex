defmodule Survey.Respons.Jawaban do
  use Ecto.Schema
  import Ecto.Changeset

  schema "jawabans" do
    field :kode_pertanyaan, :string
    field :kode_jawaban, :string
    field :jawaban, :string
    field :skor, :integer
    field :bobot, :float

    timestamps(type: :utc_datetime)

    belongs_to :pertanyaan, Survey.Kuesioners.Pertanyaan,
      foreign_key: :kode_pertanyaan,
      references: :kode_pertanyaan,
      define_field: false
  end

  @doc false
  def changeset(jawaban, attrs) do
    jawaban
    |> cast(attrs, [:kode_pertanyaan, :kode_jawaban, :jawaban, :skor, :bobot])
    |> validate_required([:kode_pertanyaan, :kode_jawaban, :jawaban, :skor, :bobot])
  end
end
