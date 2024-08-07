defmodule SurveyWeb.JawabanLiveTest do
  use SurveyWeb.ConnCase

  import Phoenix.LiveViewTest
  import Survey.ResponsFixtures

  @create_attrs %{kode_pertanyaan: "some kode_pertanyaan", kode_jawaban: "some kode_jawaban", jawaban: "some jawaban", skor: 42, bobot: 120.5}
  @update_attrs %{kode_pertanyaan: "some updated kode_pertanyaan", kode_jawaban: "some updated kode_jawaban", jawaban: "some updated jawaban", skor: 43, bobot: 456.7}
  @invalid_attrs %{kode_pertanyaan: nil, kode_jawaban: nil, jawaban: nil, skor: nil, bobot: nil}

  defp create_jawaban(_) do
    jawaban = jawaban_fixture()
    %{jawaban: jawaban}
  end

  describe "Index" do
    setup [:create_jawaban]

    test "lists all jawabans", %{conn: conn, jawaban: jawaban} do
      {:ok, _index_live, html} = live(conn, ~p"/jawabans")

      assert html =~ "Listing Jawabans"
      assert html =~ jawaban.kode_pertanyaan
    end

    test "saves new jawaban", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/jawabans")

      assert index_live |> element("a", "New Jawaban") |> render_click() =~
               "New Jawaban"

      assert_patch(index_live, ~p"/jawabans/new")

      assert index_live
             |> form("#jawaban-form", jawaban: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#jawaban-form", jawaban: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/jawabans")

      html = render(index_live)
      assert html =~ "Jawaban created successfully"
      assert html =~ "some kode_pertanyaan"
    end

    test "updates jawaban in listing", %{conn: conn, jawaban: jawaban} do
      {:ok, index_live, _html} = live(conn, ~p"/jawabans")

      assert index_live |> element("#jawabans-#{jawaban.id} a", "Edit") |> render_click() =~
               "Edit Jawaban"

      assert_patch(index_live, ~p"/jawabans/#{jawaban}/edit")

      assert index_live
             |> form("#jawaban-form", jawaban: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#jawaban-form", jawaban: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/jawabans")

      html = render(index_live)
      assert html =~ "Jawaban updated successfully"
      assert html =~ "some updated kode_pertanyaan"
    end

    test "deletes jawaban in listing", %{conn: conn, jawaban: jawaban} do
      {:ok, index_live, _html} = live(conn, ~p"/jawabans")

      assert index_live |> element("#jawabans-#{jawaban.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#jawabans-#{jawaban.id}")
    end
  end

  describe "Show" do
    setup [:create_jawaban]

    test "displays jawaban", %{conn: conn, jawaban: jawaban} do
      {:ok, _show_live, html} = live(conn, ~p"/jawabans/#{jawaban}")

      assert html =~ "Show Jawaban"
      assert html =~ jawaban.kode_pertanyaan
    end

    test "updates jawaban within modal", %{conn: conn, jawaban: jawaban} do
      {:ok, show_live, _html} = live(conn, ~p"/jawabans/#{jawaban}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Jawaban"

      assert_patch(show_live, ~p"/jawabans/#{jawaban}/show/edit")

      assert show_live
             |> form("#jawaban-form", jawaban: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#jawaban-form", jawaban: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/jawabans/#{jawaban}")

      html = render(show_live)
      assert html =~ "Jawaban updated successfully"
      assert html =~ "some updated kode_pertanyaan"
    end
  end
end
