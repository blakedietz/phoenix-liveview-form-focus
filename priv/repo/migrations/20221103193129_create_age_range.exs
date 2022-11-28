defmodule App.Repo.Migrations.CreateAgeRange do
  use Ecto.Migration

  def change do
    create table(:age_range, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :starting_age, :integer
      add :ending_age, :integer
      add :step, :integer

      timestamps()
    end
  end
end
