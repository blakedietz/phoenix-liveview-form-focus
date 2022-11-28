defmodule AppWeb.AgeRangeLive.Index do
  use AppWeb, :live_view

  alias App.Demo
  alias App.Demo.AgeRange

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :age_range_collection, list_age_range())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Age range")
    |> assign(:age_range, Demo.get_age_range!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Age range")
    |> assign(:age_range, %AgeRange{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Age range")
    |> assign(:age_range, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    age_range = Demo.get_age_range!(id)
    {:ok, _} = Demo.delete_age_range(age_range)

    {:noreply, assign(socket, :age_range_collection, list_age_range())}
  end

  defp list_age_range do
    Demo.list_age_range()
  end
end
