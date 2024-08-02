defmodule SurveyWeb.ResponLive.Show do
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
     |> assign(:respon, Respons.get_respon!(id))}
  end

  defp page_title(:show), do: "Show Respon"
  defp page_title(:edit), do: "Edit Respon"
end
