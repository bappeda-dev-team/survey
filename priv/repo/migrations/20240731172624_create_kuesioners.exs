defmodule Survey.Repo.Migrations.CreateKuesioners do
  use Ecto.Migration

  def change do
    create table(:kuesioners) do
      add :judul, :string, null: false
      add :penyelenggara, :string, null: false
      add :tahun, :integer, null: false
      add :deskripsi, :text

      timestamps(type: :utc_datetime)
    end
  end
end
