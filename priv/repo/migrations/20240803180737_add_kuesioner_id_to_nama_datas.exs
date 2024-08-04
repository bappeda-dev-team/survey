defmodule Survey.Repo.Migrations.AddKuesionerIdToNamaDatas do
  use Ecto.Migration

  def up do
    alter table(:nama_datas) do
      add :kuesioner_id, references(:kuesioners, on_delete: :nilify_all)
    end

    create index(:nama_datas, [:kuesioner_id])
  end

  def down do
    drop index(:nama_datas, [:kuesioner_id])

    alter table(:nama_datas) do
      remove :kuesioner_id
    end
  end
end
