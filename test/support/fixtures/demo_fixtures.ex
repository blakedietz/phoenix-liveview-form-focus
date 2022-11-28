defmodule App.DemoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `App.Demo` context.
  """

  @doc """
  Generate a age_range.
  """
  def age_range_fixture(attrs \\ %{}) do
    {:ok, age_range} =
      attrs
      |> Enum.into(%{
        ending_age: 42,
        starting_age: 42,
        step: 42
      })
      |> App.Demo.create_age_range()

    age_range
  end
end
