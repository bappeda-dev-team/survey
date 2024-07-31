defmodule Survey.Opds.Urusan do
  use Ecto.Schema
  import Ecto.Changeset

  schema "urusans" do
    field :kode_urusan, :string
    field :nama_urusan, :string
    field :aktif, :boolean, default: true

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(urusan, attrs) do
    urusan
    |> cast(attrs, [:kode_urusan, :nama_urusan, :aktif])
    |> validate_required([:kode_urusan, :nama_urusan, :aktif])
    |> unique_constraint(:nama_urusan)
    |> unique_constraint(:kode_urusan)
  end
end
