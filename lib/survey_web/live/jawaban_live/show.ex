defmodule SurveyWeb.JawabanLive.Show do
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
     |> assign(:jawaban, Respons.get_jawaban!(id))}
  end

  defp page_title(:show), do: "Show Jawaban"
  defp page_title(:edit), do: "Edit Jawaban"
end
