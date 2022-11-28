defmodule AppWeb.AgeRangeLive.Show do
  use AppWeb, :live_view

  alias App.Demo

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:age_range, Demo.get_age_range!(id))}
  end

  defp page_title(:show), do: "Show Age range"
  defp page_title(:edit), do: "Edit Age range"
end
