defmodule SurveyWeb.UrusanLiveTest do
  use SurveyWeb.ConnCase

  import Phoenix.LiveViewTest
  import Survey.OpdsFixtures

  @create_attrs %{kode_urusan: "some kode_urusan", nama_urusan: "some nama_urusan", aktif: true}
  @update_attrs %{kode_urusan: "some updated kode_urusan", nama_urusan: "some updated nama_urusan", aktif: false}
  @invalid_attrs %{kode_urusan: nil, nama_urusan: nil, aktif: false}

  defp create_urusan(_) do
    urusan = urusan_fixture()
    %{urusan: urusan}
  end

  describe "Index" do
    setup [:create_urusan]

    test "lists all urusans", %{conn: conn, urusan: urusan} do
      {:ok, _index_live, html} = live(conn, ~p"/urusans")

      assert html =~ "Listing Urusans"
      assert html =~ urusan.kode_urusan
    end

    test "saves new urusan", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/urusans")

      assert index_live |> element("a", "New Urusan") |> render_click() =~
               "New Urusan"

      assert_patch(index_live, ~p"/urusans/new")

      assert index_live
             |> form("#urusan-form", urusan: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#urusan-form", urusan: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/urusans")

      html = render(index_live)
      assert html =~ "Urusan created successfully"
      assert html =~ "some kode_urusan"
    end

    test "updates urusan in listing", %{conn: conn, urusan: urusan} do
      {:ok, index_live, _html} = live(conn, ~p"/urusans")

      assert index_live |> element("#urusans-#{urusan.id} a", "Edit") |> render_click() =~
               "Edit Urusan"

      assert_patch(index_live, ~p"/urusans/#{urusan}/edit")

      assert index_live
             |> form("#urusan-form", urusan: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#urusan-form", urusan: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/urusans")

      html = render(index_live)
      assert html =~ "Urusan updated successfully"
      assert html =~ "some updated kode_urusan"
    end

    test "deletes urusan in listing", %{conn: conn, urusan: urusan} do
      {:ok, index_live, _html} = live(conn, ~p"/urusans")

      assert index_live |> element("#urusans-#{urusan.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#urusans-#{urusan.id}")
    end
  end

  describe "Show" do
    setup [:create_urusan]

    test "displays urusan", %{conn: conn, urusan: urusan} do
      {:ok, _show_live, html} = live(conn, ~p"/urusans/#{urusan}")

      assert html =~ "Show Urusan"
      assert html =~ urusan.kode_urusan
    end

    test "updates urusan within modal", %{conn: conn, urusan: urusan} do
      {:ok, show_live, _html} = live(conn, ~p"/urusans/#{urusan}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Urusan"

      assert_patch(show_live, ~p"/urusans/#{urusan}/show/edit")

      assert show_live
             |> form("#urusan-form", urusan: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#urusan-form", urusan: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/urusans/#{urusan}")

      html = render(show_live)
      assert html =~ "Urusan updated successfully"
      assert html =~ "some updated kode_urusan"
    end
  end
end
