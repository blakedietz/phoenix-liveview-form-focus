defmodule AppWeb.AgeRangeLiveTest do
  use AppWeb.ConnCase

  import Phoenix.LiveViewTest
  import App.DemoFixtures

  @create_attrs %{ending_age: 42, starting_age: 42, step: 42}
  @update_attrs %{ending_age: 43, starting_age: 43, step: 43}
  @invalid_attrs %{ending_age: nil, starting_age: nil, step: nil}

  defp create_age_range(_) do
    age_range = age_range_fixture()
    %{age_range: age_range}
  end

  describe "Index" do
    setup [:create_age_range]

    test "lists all age_range", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, Routes.age_range_index_path(conn, :index))

      assert html =~ "Listing Age range"
    end

    test "saves new age_range", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.age_range_index_path(conn, :index))

      assert index_live |> element("a", "New Age range") |> render_click() =~
               "New Age range"

      assert_patch(index_live, Routes.age_range_index_path(conn, :new))

      assert index_live
             |> form("#age_range-form", age_range: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#age_range-form", age_range: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.age_range_index_path(conn, :index))

      assert html =~ "Age range created successfully"
    end

    test "updates age_range in listing", %{conn: conn, age_range: age_range} do
      {:ok, index_live, _html} = live(conn, Routes.age_range_index_path(conn, :index))

      assert index_live |> element("#age_range-#{age_range.id} a", "Edit") |> render_click() =~
               "Edit Age range"

      assert_patch(index_live, Routes.age_range_index_path(conn, :edit, age_range))

      assert index_live
             |> form("#age_range-form", age_range: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#age_range-form", age_range: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.age_range_index_path(conn, :index))

      assert html =~ "Age range updated successfully"
    end

    test "deletes age_range in listing", %{conn: conn, age_range: age_range} do
      {:ok, index_live, _html} = live(conn, Routes.age_range_index_path(conn, :index))

      assert index_live |> element("#age_range-#{age_range.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#age_range-#{age_range.id}")
    end
  end

  describe "Show" do
    setup [:create_age_range]

    test "displays age_range", %{conn: conn, age_range: age_range} do
      {:ok, _show_live, html} = live(conn, Routes.age_range_show_path(conn, :show, age_range))

      assert html =~ "Show Age range"
    end

    test "updates age_range within modal", %{conn: conn, age_range: age_range} do
      {:ok, show_live, _html} = live(conn, Routes.age_range_show_path(conn, :show, age_range))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Age range"

      assert_patch(show_live, Routes.age_range_show_path(conn, :edit, age_range))

      assert show_live
             |> form("#age_range-form", age_range: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#age_range-form", age_range: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.age_range_show_path(conn, :show, age_range))

      assert html =~ "Age range updated successfully"
    end
  end
end
