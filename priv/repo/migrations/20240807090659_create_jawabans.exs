defmodule Survey.Repo.Migrations.CreateJawabans do
  use Ecto.Migration

  def change do
    create table(:jawabans) do
      add :kode_pertanyaan, :string
      add :kode_jawaban, :string
      add :jawaban, :string
      add :skor, :integer
      add :bobot, :float

      timestamps(type: :utc_datetime)
    end

    create unique_index(:jawabans, [:kode_jawaban])
  end
end
