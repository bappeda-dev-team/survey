defmodule SurveyWeb.PesertaLiveTest do
  use SurveyWeb.ConnCase

  import Phoenix.LiveViewTest
  import Survey.ResponsFixtures

  @create_attrs %{jenis_id: "some jenis_id", kode_peserta: "some kode_peserta", nama_peserta: "some nama_peserta", tahun: 42, keterangan: "some keterangan"}
  @update_attrs %{jenis_id: "some updated jenis_id", kode_peserta: "some updated kode_peserta", nama_peserta: "some updated nama_peserta", tahun: 43, keterangan: "some updated keterangan"}
  @invalid_attrs %{jenis_id: nil, kode_peserta: nil, nama_peserta: nil, tahun: nil, keterangan: nil}

  defp create_peserta(_) do
    peserta = peserta_fixture()
    %{peserta: peserta}
  end

  describe "Index" do
    setup [:create_peserta]

    test "lists all pesertas", %{conn: conn, peserta: peserta} do
      {:ok, _index_live, html} = live(conn, ~p"/pesertas")

      assert html =~ "Listing Pesertas"
      assert html =~ peserta.jenis_id
    end

    test "saves new peserta", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/pesertas")

      assert index_live |> element("a", "New Peserta") |> render_click() =~
               "New Peserta"

      assert_patch(index_live, ~p"/pesertas/new")

      assert index_live
             |> form("#peserta-form", peserta: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#peserta-form", peserta: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/pesertas")

      html = render(index_live)
      assert html =~ "Peserta created successfully"
      assert html =~ "some jenis_id"
    end

    test "updates peserta in listing", %{conn: conn, peserta: peserta} do
      {:ok, index_live, _html} = live(conn, ~p"/pesertas")

      assert index_live |> element("#pesertas-#{peserta.id} a", "Edit") |> render_click() =~
               "Edit Peserta"

      assert_patch(index_live, ~p"/pesertas/#{peserta}/edit")

      assert index_live
             |> form("#peserta-form", peserta: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#peserta-form", peserta: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/pesertas")

      html = render(index_live)
      assert html =~ "Peserta updated successfully"
      assert html =~ "some updated jenis_id"
    end

    test "deletes peserta in listing", %{conn: conn, peserta: peserta} do
      {:ok, index_live, _html} = live(conn, ~p"/pesertas")

      assert index_live |> element("#pesertas-#{peserta.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#pesertas-#{peserta.id}")
    end
  end

  describe "Show" do
    setup [:create_peserta]

    test "displays peserta", %{conn: conn, peserta: peserta} do
      {:ok, _show_live, html} = live(conn, ~p"/pesertas/#{peserta}")

      assert html =~ "Show Peserta"
      assert html =~ peserta.jenis_id
    end

    test "updates peserta within modal", %{conn: conn, peserta: peserta} do
      {:ok, show_live, _html} = live(conn, ~p"/pesertas/#{peserta}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Peserta"

      assert_patch(show_live, ~p"/pesertas/#{peserta}/show/edit")

      assert show_live
             |> form("#peserta-form", peserta: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#peserta-form", peserta: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/pesertas/#{peserta}")

      html = render(show_live)
      assert html =~ "Peserta updated successfully"
      assert html =~ "some updated jenis_id"
    end
  end
end
