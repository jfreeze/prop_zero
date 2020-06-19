defmodule PropZeroWeb.DashboardComponent do
  use PropZeroWeb, :live_component

  import PropZeroWeb.ControlPanelLive, only: [debug: 1]

  @impl true
  def render(assigns) do
    ~L"""
    <div>This is the dashboard component</div>

    <button type="button" phx-click="new-event"
    class="inline-flex items-center px-6 py-3 text-base font-medium leading-6 text-white transition duration-150 ease-in-out border border-transparent rounded-md bg-light-blue-600 hover:bg-light-blue-500 focus:outline-none focus:border-light-blue-700 focus:shadow-outline-light-blue active:bg-light-blue-700">
    Create Event Button (via push_patch)
    </button>

    """
  end

  # @impl true
  # def handle_event("new-event", _params, socket) do
  #   IO.puts("new event")
  #   {:noreply, socket}
  # end
end
