defmodule Survey.Repo.Migrations.CreateNamaDataKuesioners do
  use Ecto.Migration

  def change do
    create table(:nama_data_kuesioners, primary_key: false) do
      add :kuesioner_id, references(:kuesioners, on_delete: :delete_all)
      add :nama_data_id, references(:nama_datas, on_delete: :delete_all)
    end

    create index(:nama_data_kuesioners, [:kuesioner_id, :nama_data_id])
  end
end
