defmodule SurveyWeb.PesertaLive.Show do
  use SurveyWeb, :live_view

  alias Survey.Respons

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:peserta, Respons.get_peserta!(id))}
  end

  defp page_title(:show), do: "Show Peserta"
  defp page_title(:edit), do: "Edit Peserta"

  defp judul_kuesioner(kuesioner_id: kuesioner_id) do
    Survey.Kuesioners.judul_kuesioner_peserta(kuesioner_id)
  end
end
