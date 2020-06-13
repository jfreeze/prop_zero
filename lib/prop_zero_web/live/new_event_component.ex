defmodule PropZeroWeb.NewEventComponent do
  use PropZeroWeb, :live_component
  import Ecto.Changeset

  @impl true
  def mount(socket) do
    {:ok, socket}
  end

  @impl true
  def update(assigns, socket) do
    changeset = "changeset"

    {:ok,
     assign(socket, assigns)
     |> assign(changeset: changeset)
     |> assign(slug_mode: :view, slug_edited: false)}
  end

  @impl true
  def handle_event("slug-mode", _params, socket) do
    {:noreply, assign(socket, slug_mode: :edit)}
  end

  defp slug_mode(changeset) do
    case Keyword.fetch(changeset.errors, :slug) do
      :error -> :view
      _ -> :edit
    end
  end
end
