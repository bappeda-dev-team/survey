defmodule Survey.Kuesioners.NamaData do
  use Ecto.Schema
  import Ecto.Changeset

  schema "nama_datas" do
    field :nama_data, :string
    field :konsep, :string
    field :metodologi, :string
    field :kode_bidang_urusan, :string
    field :keterangan, :string
    field :tahun, :integer

    timestamps(type: :utc_datetime)

    belongs_to :bidang_urusan, Survey.Opds.BidangUrusan,
      foreign_key: :kode_bidang_urusan,
      references: :kode_bidang_urusan,
      define_field: false

    belongs_to :kuesioner, Survey.Kuesioners.Kuesioner

    has_many :pertanyaans, Survey.Kuesioners.Pertanyaan
  end

  @doc false
  def changeset(nama_data, attrs) do
    nama_data
    |> cast(attrs, [
      :nama_data,
      :konsep,
      :metodologi,
      :kode_bidang_urusan,
      :keterangan,
      :tahun,
      :kuesioner_id
    ])
    |> validate_required([:nama_data, :konsep, :metodologi, :kode_bidang_urusan, :tahun])
  end
end
