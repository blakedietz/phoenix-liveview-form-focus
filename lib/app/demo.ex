defmodule App.Demo do
  @moduledoc """
  The Demo context.
  """

  import Ecto.Query, warn: false
  alias App.Repo

  alias App.Demo.AgeRange

  @doc """
  Returns the list of age_range.

  ## Examples

      iex> list_age_range()
      [%AgeRange{}, ...]

  """
  def list_age_range do
    Repo.all(AgeRange)
  end

  @doc """
  Gets a single age_range.

  Raises `Ecto.NoResultsError` if the Age range does not exist.

  ## Examples

      iex> get_age_range!(123)
      %AgeRange{}

      iex> get_age_range!(456)
      ** (Ecto.NoResultsError)

  """
  def get_age_range!(id), do: Repo.get!(AgeRange, id)

  @doc """
  Creates a age_range.

  ## Examples

      iex> create_age_range(%{field: value})
      {:ok, %AgeRange{}}

      iex> create_age_range(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_age_range(attrs \\ %{}) do
    %AgeRange{}
    |> AgeRange.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a age_range.

  ## Examples

      iex> update_age_range(age_range, %{field: new_value})
      {:ok, %AgeRange{}}

      iex> update_age_range(age_range, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_age_range(%AgeRange{} = age_range, attrs) do
    age_range
    |> AgeRange.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a age_range.

  ## Examples

      iex> delete_age_range(age_range)
      {:ok, %AgeRange{}}

      iex> delete_age_range(age_range)
      {:error, %Ecto.Changeset{}}

  """
  def delete_age_range(%AgeRange{} = age_range) do
    Repo.delete(age_range)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking age_range changes.

  ## Examples

      iex> change_age_range(age_range)
      %Ecto.Changeset{data: %AgeRange{}}

  """
  def change_age_range(%AgeRange{} = age_range, attrs \\ %{}) do
    AgeRange.changeset(age_range, attrs)
  end
end
