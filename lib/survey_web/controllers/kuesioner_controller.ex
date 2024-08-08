defmodule SurveyWeb.KuesionerController do
  use SurveyWeb, :controller

  alias Survey.Kuesioners

  def input_survey(conn, %{"id" => id}) do
    kuesioner = Kuesioners.get_kuesioner!(id)
    render(conn, :input_survey, kuesioner: kuesioner)
  end
end
