defmodule Survey.Penduduks.Penduduk do
  use Ecto.Schema
  import Ecto.Changeset

  schema "penduduks" do
    field :kode_unik, :string
    field :nik, :string
    field :nokk, :string
    field :nama, :string
    field :tanggal_lahir, :date
    field :jenis_kelamin, :string
    field :kelurahan, :string
    field :kecamatan, :string
    field :kota_kab, :string
    field :rt, :string
    field :rw, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(penduduk, attrs) do
    penduduk
    |> cast(attrs, [:kode_unik, :nik, :nokk, :nama, :tanggal_lahir, :jenis_kelamin, :kelurahan, :kecamatan, :kota_kab, :rt, :rw])
    |> validate_required([:kode_unik, :nik, :nokk, :nama, :tanggal_lahir, :jenis_kelamin, :kelurahan, :kecamatan, :kota_kab, :rt, :rw])
  end
end
