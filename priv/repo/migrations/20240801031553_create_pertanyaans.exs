defmodule Survey.Repo.Migrations.CreatePertanyaans do
  use Ecto.Migration

  def change do
    create table(:pertanyaans) do
      add :kode_pertanyaan, :string
      add :pertanyaan, :string
      add :nama_data_id, references(:nama_datas, on_delete: :nilify_all)

      timestamps(type: :utc_datetime)
    end

    create index(:pertanyaans, [:nama_data_id])
  end
end
