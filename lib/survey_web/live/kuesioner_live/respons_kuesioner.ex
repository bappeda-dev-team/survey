defmodule SurveyWeb.KuesionerLive.ResponsKuesioner do
  use SurveyWeb, :live_view

  alias Survey.Kuesioners
  alias Survey.Respons

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(params, _, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :respons_kuesioner, %{"id" => id}) do
    socket
    |> assign(:page_title, "Respons Kuesioner")
    |> assign(:kuesioner, Kuesioners.get_pertanyaan_kuesioner!(id))
  end

  def responden_kuesioner(pertanyaans) do
    pertanyaans
    |> Enum.flat_map(fn prt -> Respons.list_responden(prt.kode_pertanyaan) end)
    |> Enum.uniq()
  end

  def respon_peserta(kode_pertanyaan: kode_pertanyaan, kode_peserta: kode_peserta) do
    respon =
      Respons.respon_pertanyaan_peserta(
        kode_pertanyaan: kode_pertanyaan,
        kode_peserta: kode_peserta
      )

    if Enum.empty?(respon), do: "-", else: respon
  end

  def nama_responden(kode_responden: kode_responden) do
    Respons.nama_responden(kode_responden: kode_responden)
  end
end
