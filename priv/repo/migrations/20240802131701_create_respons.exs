defmodule Survey.Repo.Migrations.CreateRespons do
  use Ecto.Migration

  def change do
    create table(:respons) do
      add :kode_peserta, :string
      add :kode_pertanyaan, :string
      add :respon, :string

      timestamps(type: :utc_datetime)
    end
  end
end
