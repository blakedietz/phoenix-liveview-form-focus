defmodule App.DemoTest do
  use App.DataCase

  alias App.Demo

  describe "age_range" do
    alias App.Demo.AgeRange

    import App.DemoFixtures

    @invalid_attrs %{ending_age: nil, starting_age: nil, step: nil}

    test "list_age_range/0 returns all age_range" do
      age_range = age_range_fixture()
      assert Demo.list_age_range() == [age_range]
    end

    test "get_age_range!/1 returns the age_range with given id" do
      age_range = age_range_fixture()
      assert Demo.get_age_range!(age_range.id) == age_range
    end

    test "create_age_range/1 with valid data creates a age_range" do
      valid_attrs = %{ending_age: 42, starting_age: 42, step: 42}

      assert {:ok, %AgeRange{} = age_range} = Demo.create_age_range(valid_attrs)
      assert age_range.ending_age == 42
      assert age_range.starting_age == 42
      assert age_range.step == 42
    end

    test "create_age_range/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Demo.create_age_range(@invalid_attrs)
    end

    test "update_age_range/2 with valid data updates the age_range" do
      age_range = age_range_fixture()
      update_attrs = %{ending_age: 43, starting_age: 43, step: 43}

      assert {:ok, %AgeRange{} = age_range} = Demo.update_age_range(age_range, update_attrs)
      assert age_range.ending_age == 43
      assert age_range.starting_age == 43
      assert age_range.step == 43
    end

    test "update_age_range/2 with invalid data returns error changeset" do
      age_range = age_range_fixture()
      assert {:error, %Ecto.Changeset{}} = Demo.update_age_range(age_range, @invalid_attrs)
      assert age_range == Demo.get_age_range!(age_range.id)
    end

    test "delete_age_range/1 deletes the age_range" do
      age_range = age_range_fixture()
      assert {:ok, %AgeRange{}} = Demo.delete_age_range(age_range)
      assert_raise Ecto.NoResultsError, fn -> Demo.get_age_range!(age_range.id) end
    end

    test "change_age_range/1 returns a age_range changeset" do
      age_range = age_range_fixture()
      assert %Ecto.Changeset{} = Demo.change_age_range(age_range)
    end
  end
end
