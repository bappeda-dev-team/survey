defmodule Survey.Repo.Migrations.CreatePesertas do
  use Ecto.Migration

  def change do
    create table(:pesertas) do
      add :jenis_identitas, :string
      add :kode_peserta, :string
      add :nama_peserta, :string
      add :tahun, :integer
      add :keterangan, :string
      add :kuesioner_id, references(:kuesioners, on_delete: :nilify_all)

      timestamps(type: :utc_datetime)
    end

    create index(:pesertas, [:kuesioner_id])
  end
end
