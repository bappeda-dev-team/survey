defmodule SurveyWeb.OpdLive.Show do
  use SurveyWeb, :live_view

  alias Survey.Opds

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:opd, Opds.get_opd!(id))}
  end

  defp page_title(:show), do: "Show Opd"
  defp page_title(:edit), do: "Edit Opd"
end
