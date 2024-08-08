defmodule Survey.Respons.Peserta do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pesertas" do
    field :jenis_identitas, :string
    field :kode_peserta, :string
    field :nama_peserta, :string
    field :tahun, :integer
    field :keterangan, :string

    timestamps(type: :utc_datetime)

    belongs_to :kuesioner, Survey.Kuesioners.Kuesioner
  end

  @doc false
  def changeset(peserta, attrs) do
    peserta
    |> cast(attrs, [
      :jenis_identitas,
      :kode_peserta,
      :nama_peserta,
      :tahun,
      :keterangan,
      :kuesioner_id
    ])
    |> validate_required([:jenis_identitas, :kode_peserta, :nama_peserta, :tahun, :keterangan])
  end
end
