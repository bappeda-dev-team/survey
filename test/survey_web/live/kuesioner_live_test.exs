defmodule SurveyWeb.KuesionerLiveTest do
  use SurveyWeb.ConnCase

  import Phoenix.LiveViewTest
  import Survey.KuesionersFixtures

  @create_attrs %{judul: "some judul", penyelenggara: "some penyelenggara", tahun: 42, deskripsi: "some deskripsi"}
  @update_attrs %{judul: "some updated judul", penyelenggara: "some updated penyelenggara", tahun: 43, deskripsi: "some updated deskripsi"}
  @invalid_attrs %{judul: nil, penyelenggara: nil, tahun: nil, deskripsi: nil}

  defp create_kuesioner(_) do
    kuesioner = kuesioner_fixture()
    %{kuesioner: kuesioner}
  end

  describe "Index" do
    setup [:create_kuesioner]

    test "lists all kuesioners", %{conn: conn, kuesioner: kuesioner} do
      {:ok, _index_live, html} = live(conn, ~p"/kuesioners")

      assert html =~ "Listing Kuesioners"
      assert html =~ kuesioner.judul
    end

    test "saves new kuesioner", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/kuesioners")

      assert index_live |> element("a", "New Kuesioner") |> render_click() =~
               "New Kuesioner"

      assert_patch(index_live, ~p"/kuesioners/new")

      assert index_live
             |> form("#kuesioner-form", kuesioner: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#kuesioner-form", kuesioner: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/kuesioners")

      html = render(index_live)
      assert html =~ "Kuesioner created successfully"
      assert html =~ "some judul"
    end

    test "updates kuesioner in listing", %{conn: conn, kuesioner: kuesioner} do
      {:ok, index_live, _html} = live(conn, ~p"/kuesioners")

      assert index_live |> element("#kuesioners-#{kuesioner.id} a", "Edit") |> render_click() =~
               "Edit Kuesioner"

      assert_patch(index_live, ~p"/kuesioners/#{kuesioner}/edit")

      assert index_live
             |> form("#kuesioner-form", kuesioner: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#kuesioner-form", kuesioner: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/kuesioners")

      html = render(index_live)
      assert html =~ "Kuesioner updated successfully"
      assert html =~ "some updated judul"
    end

    test "deletes kuesioner in listing", %{conn: conn, kuesioner: kuesioner} do
      {:ok, index_live, _html} = live(conn, ~p"/kuesioners")

      assert index_live |> element("#kuesioners-#{kuesioner.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#kuesioners-#{kuesioner.id}")
    end
  end

  describe "Show" do
    setup [:create_kuesioner]

    test "displays kuesioner", %{conn: conn, kuesioner: kuesioner} do
      {:ok, _show_live, html} = live(conn, ~p"/kuesioners/#{kuesioner}")

      assert html =~ "Show Kuesioner"
      assert html =~ kuesioner.judul
    end

    test "updates kuesioner within modal", %{conn: conn, kuesioner: kuesioner} do
      {:ok, show_live, _html} = live(conn, ~p"/kuesioners/#{kuesioner}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Kuesioner"

      assert_patch(show_live, ~p"/kuesioners/#{kuesioner}/show/edit")

      assert show_live
             |> form("#kuesioner-form", kuesioner: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#kuesioner-form", kuesioner: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/kuesioners/#{kuesioner}")

      html = render(show_live)
      assert html =~ "Kuesioner updated successfully"
      assert html =~ "some updated judul"
    end
  end
end
