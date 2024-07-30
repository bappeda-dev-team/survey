defmodule Survey.Opds.Opd do
  use Ecto.Schema
  import Ecto.Changeset

  schema "opds" do
    field :nama_opd, :string
    field :kode_opd, :string
    field :aktif, :boolean, default: true

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(opd, attrs) do
    opd
    |> cast(attrs, [:nama_opd, :kode_opd])
    |> validate_required([:nama_opd, :kode_opd])
    |> unique_constraint(:kode_opd)
    |> unique_constraint(:nama_opd)
  end
end
