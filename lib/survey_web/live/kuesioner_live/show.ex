defmodule SurveyWeb.KuesionerLive.Show do
  use SurveyWeb, :live_view

  alias Survey.Kuesioners

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:kuesioner, Kuesioners.get_kuesioner!(id))}
  end

  defp page_title(:show), do: "Show Kuesioner"
  defp page_title(:edit), do: "Edit Kuesioner"
  defp page_title(:pilih_nama_data), do: "Pilih Nama Data"
end
