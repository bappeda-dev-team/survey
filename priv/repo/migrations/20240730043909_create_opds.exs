defmodule Survey.Repo.Migrations.CreateOpds do
  use Ecto.Migration

  def change do
    create table(:opds) do
      add :nama_opd, :string
      add :kode_opd, :string
      add :aktif, :boolean, default: true, null: false

      timestamps(type: :utc_datetime)
    end

    create unique_index(:opds, [:kode_opd])
    create unique_index(:opds, [:nama_opd])
  end
end
