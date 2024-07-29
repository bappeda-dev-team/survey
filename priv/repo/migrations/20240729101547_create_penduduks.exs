defmodule Survey.Repo.Migrations.CreatePenduduks do
  use Ecto.Migration

  def change do
    create table(:penduduks) do
      add :kode_unik, :string
      add :nik, :string
      add :nokk, :string
      add :nama, :string
      add :tanggal_lahir, :date
      add :jenis_kelamin, :string
      add :kelurahan, :string
      add :kecamatan, :string
      add :kota_kab, :string
      add :rt, :string
      add :rw, :string

      timestamps(type: :utc_datetime)
    end
  end
end
