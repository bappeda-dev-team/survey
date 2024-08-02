defmodule SurveyWeb.PertanyaanLiveTest do
  use SurveyWeb.ConnCase

  import Phoenix.LiveViewTest
  import Survey.KuesionersFixtures

  @create_attrs %{kode_pertanyaan: "some kode_pertanyaan", pertanyaan: "some pertanyaan"}
  @update_attrs %{kode_pertanyaan: "some updated kode_pertanyaan", pertanyaan: "some updated pertanyaan"}
  @invalid_attrs %{kode_pertanyaan: nil, pertanyaan: nil}

  defp create_pertanyaan(_) do
    pertanyaan = pertanyaan_fixture()
    %{pertanyaan: pertanyaan}
  end

  describe "Index" do
    setup [:create_pertanyaan]

    test "lists all pertanyaans", %{conn: conn, pertanyaan: pertanyaan} do
      {:ok, _index_live, html} = live(conn, ~p"/pertanyaans")

      assert html =~ "Listing Pertanyaans"
      assert html =~ pertanyaan.kode_pertanyaan
    end

    test "saves new pertanyaan", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/pertanyaans")

      assert index_live |> element("a", "New Pertanyaan") |> render_click() =~
               "New Pertanyaan"

      assert_patch(index_live, ~p"/pertanyaans/new")

      assert index_live
             |> form("#pertanyaan-form", pertanyaan: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#pertanyaan-form", pertanyaan: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/pertanyaans")

      html = render(index_live)
      assert html =~ "Pertanyaan created successfully"
      assert html =~ "some kode_pertanyaan"
    end

    test "updates pertanyaan in listing", %{conn: conn, pertanyaan: pertanyaan} do
      {:ok, index_live, _html} = live(conn, ~p"/pertanyaans")

      assert index_live |> element("#pertanyaans-#{pertanyaan.id} a", "Edit") |> render_click() =~
               "Edit Pertanyaan"

      assert_patch(index_live, ~p"/pertanyaans/#{pertanyaan}/edit")

      assert index_live
             |> form("#pertanyaan-form", pertanyaan: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#pertanyaan-form", pertanyaan: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/pertanyaans")

      html = render(index_live)
      assert html =~ "Pertanyaan updated successfully"
      assert html =~ "some updated kode_pertanyaan"
    end

    test "deletes pertanyaan in listing", %{conn: conn, pertanyaan: pertanyaan} do
      {:ok, index_live, _html} = live(conn, ~p"/pertanyaans")

      assert index_live |> element("#pertanyaans-#{pertanyaan.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#pertanyaans-#{pertanyaan.id}")
    end
  end

  describe "Show" do
    setup [:create_pertanyaan]

    test "displays pertanyaan", %{conn: conn, pertanyaan: pertanyaan} do
      {:ok, _show_live, html} = live(conn, ~p"/pertanyaans/#{pertanyaan}")

      assert html =~ "Show Pertanyaan"
      assert html =~ pertanyaan.kode_pertanyaan
    end

    test "updates pertanyaan within modal", %{conn: conn, pertanyaan: pertanyaan} do
      {:ok, show_live, _html} = live(conn, ~p"/pertanyaans/#{pertanyaan}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Pertanyaan"

      assert_patch(show_live, ~p"/pertanyaans/#{pertanyaan}/show/edit")

      assert show_live
             |> form("#pertanyaan-form", pertanyaan: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#pertanyaan-form", pertanyaan: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/pertanyaans/#{pertanyaan}")

      html = render(show_live)
      assert html =~ "Pertanyaan updated successfully"
      assert html =~ "some updated kode_pertanyaan"
    end
  end
end
