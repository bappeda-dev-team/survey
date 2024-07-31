defmodule Survey.Repo.Migrations.CreateBidangUrusans do
  use Ecto.Migration

  def change do
    create table(:bidang_urusans) do
      add :kode_bidang_urusan, :string
      add :nama_bidang_urusan, :string
      add :aktif, :boolean, default: false, null: false
      add :kode_urusan, references(:urusans, type: :string, column: :kode_urusan, on_delete: :restrict)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:bidang_urusans, [:nama_bidang_urusan])
    create unique_index(:bidang_urusans, [:kode_bidang_urusan])
    create index(:bidang_urusans, [:kode_urusan])
  end
end
