defmodule Survey.Respons.Respon do
  use Ecto.Schema
  import Ecto.Changeset

  schema "respons" do
    field :kode_peserta, :string
    field :kode_pertanyaan, :string
    field :respon, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(respon, attrs) do
    respon
    |> cast(attrs, [:kode_peserta, :kode_pertanyaan, :respon])
    |> validate_required([:kode_peserta, :kode_pertanyaan, :respon])
  end
end
