defmodule Survey.Opds.BidangUrusan do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bidang_urusans" do
    field :kode_bidang_urusan, :string
    field :nama_bidang_urusan, :string
    field :aktif, :boolean, default: true
    field :kode_urusan, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(bidang_urusan, attrs) do
    bidang_urusan
    |> cast(attrs, [:kode_bidang_urusan, :nama_bidang_urusan, :aktif])
    |> validate_required([:kode_bidang_urusan, :nama_bidang_urusan, :aktif])
    |> unique_constraint(:nama_bidang_urusan)
    |> unique_constraint(:kode_bidang_urusan)
  end
end
