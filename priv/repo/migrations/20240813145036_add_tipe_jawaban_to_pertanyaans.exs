defmodule Survey.Repo.Migrations.AddTipeJawabanToPertanyaans do
  use Ecto.Migration

  def up do
    alter table(:pertanyaans) do
      add :tipe_jawaban, :string, null: true
    end
  end

  def down do
    alter table(:pertanyaans) do
      remove :tipe_jawaban
    end
  end
end
