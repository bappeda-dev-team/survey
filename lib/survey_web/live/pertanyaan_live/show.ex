defmodule SurveyWeb.PertanyaanLive.Show do
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
     |> assign(:pertanyaan, Kuesioners.get_pertanyaan!(id))}
  end

  defp page_title(:show), do: "Show Pertanyaan"
  defp page_title(:edit), do: "Edit Pertanyaan"
end
