defmodule App.Demo.AgeRange do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "age_range" do
    field :ending_age, :integer, default: 0
    field :starting_age, :integer, default: 0
    field :step, :integer, default: 10

    timestamps()
  end

  @doc false
  def changeset(age_range, attrs) do
    age_range
    |> cast(attrs, [:starting_age, :ending_age, :step])
    |> validate_required([:starting_age, :ending_age, :step])
  end
end
