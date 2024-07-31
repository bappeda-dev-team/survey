defmodule Survey.Repo.Migrations.CreateNamaDatas do
  use Ecto.Migration

  def change do
    create table(:nama_datas) do
      add :nama_data, :text, null: false
      add :konsep, :text
      add :metodologi, :text
      add :keterangan, :string
      add :tahun, :integer, null: false
      add :kode_bidang_urusan, references(:bidang_urusans, type: :string, column: :kode_bidang_urusan, on_delete: :nilify_all)

      timestamps(type: :utc_datetime)
    end

    create index(:nama_datas, [:kode_bidang_urusan])
  end
end
