defmodule SurveyWeb.JawabanLive.Index do
  use SurveyWeb, :live_view

  alias Survey.Respons
  alias Survey.Respons.Jawaban

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :jawabans, Respons.list_jawabans())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Jawaban")
    |> assign(:jawaban, Respons.get_jawaban!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Jawaban")
    |> assign(:jawaban, %Jawaban{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Jawabans")
    |> assign(:jawaban, nil)
  end

  @impl true
  def handle_info({SurveyWeb.JawabanLive.FormComponent, {:saved, jawaban}}, socket) do
    {:noreply, stream_insert(socket, :jawabans, jawaban)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    jawaban = Respons.get_jawaban!(id)
    {:ok, _} = Respons.delete_jawaban(jawaban)

    {:noreply, stream_delete(socket, :jawabans, jawaban)}
  end
end
