defmodule SurveyWeb.KuesionerLive.Index do
  use SurveyWeb, :live_view

  alias Survey.Kuesioners
  alias Survey.Kuesioners.Kuesioner

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :kuesioners, Kuesioners.list_kuesioners())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Kuesioner")
    |> assign(:kuesioner, Kuesioners.get_kuesioner!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "Tambah Data Kuesioner")
    |> assign(:kuesioner, %Kuesioner{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Daftar Kuesioner")
    |> assign(:kuesioner, nil)
  end

  @impl true
  def handle_info({SurveyWeb.KuesionerLive.FormComponent, {:saved, kuesioner}}, socket) do
    {:noreply, stream_insert(socket, :kuesioners, kuesioner)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    kuesioner = Kuesioners.get_kuesioner!(id)
    {:ok, _} = Kuesioners.delete_kuesioner(kuesioner)

    {:noreply, stream_delete(socket, :kuesioners, kuesioner)}
  end
end
