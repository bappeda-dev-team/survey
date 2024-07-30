defmodule SurveyWeb.OpdLive.Index do
  use SurveyWeb, :live_view

  alias Survey.Opds
  alias Survey.Opds.Opd

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :opds, Opds.list_opds())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Opd")
    |> assign(:opd, Opds.get_opd!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "Tambah Data OPD")
    |> assign(:opd, %Opd{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Daftar OPD")
    |> assign(:opd, nil)
  end

  @impl true
  def handle_info({SurveyWeb.OpdLive.FormComponent, {:saved, opd}}, socket) do
    {:noreply, stream_insert(socket, :opds, opd)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    opd = Opds.get_opd!(id)
    {:ok, _} = Opds.delete_opd(opd)

    {:noreply, stream_delete(socket, :opds, opd)}
  end
end
