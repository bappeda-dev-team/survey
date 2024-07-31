defmodule SurveyWeb.BidangUrusanLive.Show do
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
     |> assign(:bidang_urusan, Opds.get_bidang_urusan!(id))}
  end

  defp page_title(:show), do: "Show Bidang urusan"
  defp page_title(:edit), do: "Edit Bidang urusan"
end
