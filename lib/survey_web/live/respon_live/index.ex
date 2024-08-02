defmodule SurveyWeb.ResponLive.Index do
  use SurveyWeb, :live_view

  alias Survey.Respons
  alias Survey.Respons.Respon

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :respons, Respons.list_respons())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Respon")
    |> assign(:respon, Respons.get_respon!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Respon")
    |> assign(:respon, %Respon{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Respons")
    |> assign(:respon, nil)
  end

  @impl true
  def handle_info({SurveyWeb.ResponLive.FormComponent, {:saved, respon}}, socket) do
    {:noreply, stream_insert(socket, :respons, respon)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    respon = Respons.get_respon!(id)
    {:ok, _} = Respons.delete_respon(respon)

    {:noreply, stream_delete(socket, :respons, respon)}
  end
end
