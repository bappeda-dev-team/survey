defmodule SurveyWeb.KuesionerController do
  use SurveyWeb, :controller

  alias Survey.{Kuesioners, Respons}

  def input_survey(conn, %{"id" => id}) do
    kuesioner = Kuesioners.get_kuesioner!(id)
    render(conn, :input_survey, kuesioner: kuesioner)
  end

  def input_jawaban_peserta(conn, %{"id" => kuesioner_id, "peserta_id" => peserta_id}) do
    kuesioner = Kuesioners.get_kuesioner!(kuesioner_id)
    peserta = Respons.get_peserta!(peserta_id)

    render(conn, :input_jawaban_peserta, kuesioner: kuesioner, peserta: peserta)
  end
end
