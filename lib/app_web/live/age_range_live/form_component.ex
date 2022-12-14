defmodule AppWeb.AgeRangeLive.FormComponent do
  use AppWeb, :live_component

  alias App.Demo

  @impl true
  def update(%{age_range: age_range} = assigns, socket) do
    changeset = Demo.change_age_range(age_range)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  # Purely used for illustrative purposes. Note that we're pattern matching on age_range.step via the "_target" argument.
  # So this is only going to apply to the step element form changes.
  def handle_event(
        "validate",
        %{
          "_target" => ["age_range", "step"],
          "age_range" => %{"starting_age" => starting_age}
        },
        socket
      ) do
    changeset =
      socket.assigns.age_range
      |> Demo.change_age_range(%{
        starting_age: starting_age |> String.to_integer(),
        ending_age: (starting_age |> String.to_integer()) + 10,
        # Here we expliclity are trying to set the value to 0, but it does nothing. See
        # images/in-focus.gif.
        step: 0
      })
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event(
        "validate",
        %{"age_range" => %{"starting_age" => starting_age}},
        socket
      ) do
    changeset =
      socket.assigns.age_range
      |> Demo.change_age_range(%{
        # Here' we're modifying the ending_age form element and changes are being accepted.
        starting_age: starting_age |> String.to_integer(),
        ending_age: (starting_age |> String.to_integer()) + 10
      })
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"age_range" => age_range_params}, socket) do
    save_age_range(socket, socket.assigns.action, age_range_params)
  end

  defp save_age_range(socket, :edit, age_range_params) do
    case Demo.update_age_range(socket.assigns.age_range, age_range_params) do
      {:ok, _age_range} ->
        {:noreply,
         socket
         |> put_flash(:info, "Age range updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_age_range(socket, :new, age_range_params) do
    case Demo.create_age_range(age_range_params) do
      {:ok, _age_range} ->
        {:noreply,
         socket
         |> put_flash(:info, "Age range created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
