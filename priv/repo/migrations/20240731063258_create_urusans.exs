defmodule Survey.Repo.Migrations.CreateUrusans do
  use Ecto.Migration

  def change do
    create table(:urusans) do
      add :kode_urusan, :string
      add :nama_urusan, :string
      add :aktif, :boolean, default: true, null: false

      timestamps(type: :utc_datetime)
    end

    create unique_index(:urusans, [:nama_urusan])
    create unique_index(:urusans, [:kode_urusan])
  end
end
