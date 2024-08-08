defmodule Survey.Kuesioners.Kuesioner do
  use Ecto.Schema
  import Ecto.Changeset

  schema "kuesioners" do
    field :judul, :string
    field :penyelenggara, :string
    field :tahun, :integer
    field :deskripsi, :string

    timestamps(type: :utc_datetime)

    has_many :nama_datas, Survey.Kuesioners.NamaData
    has_many :pesertas, Survey.Respons.Peserta
  end

  @doc false
  def changeset(kuesioner, attrs) do
    kuesioner
    |> cast(attrs, [:judul, :penyelenggara, :tahun, :deskripsi])
    |> validate_required([:judul, :penyelenggara, :tahun, :deskripsi])
  end
end
