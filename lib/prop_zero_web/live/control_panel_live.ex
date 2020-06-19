defmodule PropZeroWeb.ControlPanelLive do
  use PropZeroWeb, :live_view

  alias PropZeroWeb.DashboardComponent
  alias PropZeroWeb.NewEventComponent

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       event: nil,
       counter: 0,
       events: []
     )}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  @impl true
  def handle_event("new-event", _params, socket) do
    IO.puts("\n\n---- new-event")
    {:noreply, push_patch(socket, to: Routes.control_panel_path(socket, :new_event))}
  end

  def handle_event(_, _params, socket) do
    IO.puts("\n\n how did we get here?")
    {:noreply, socket}
  end

  defp apply_action(socket, :dashboard, _params) do
    socket
    |> assign(:page_title, "Dashboard")
    |> assign(:event, nil)
    |> update(:counter, &(&1 + 1))
  end

  defp apply_action(socket, :new_event, _params) do
    socket
    |> assign(:page_title, "Create Event")
    |> assign(:event, nil)
    |> update(:counter, &(&1 + 1))
  end

  defp apply_action(socket, _, _) do
    socket
    |> update(:counter, &(&1 + 1))
  end

  # For dev
  def debug(assigns) do
    ~L"""
    <div class="grid grid-cols-6 pt-8 mt-12 text-center border-t border-gray-200">
      <h1 class="col-span-6 font-bold uppercase">Debug</h1>
    </div>

    <%= for {label, item} <- [
    {:live_action, @live_action},
    {:live_module, @live_module},
    {:assigns, Map.keys(assigns)},
    {:flash, @flash},
    {:root_view, @socket.root_view},
    {:view, @socket.view},
    {:id, @socket.id},
    {:host_uri, @socket.host_uri},
    {:router, @socket.router}
    ] do %>
    <div class="grid grid-cols-6 col-gap-4 text-right">
      <div class="col-span-2 font-bold"><%= label %></div>
      <div class="col-span-4 text-left"><%= inspect item %></div>
    </div>
    <% end %>
    """
  end
end
