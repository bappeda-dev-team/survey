defmodule SurveyWeb.BidangUrusanLiveTest do
  use SurveyWeb.ConnCase

  import Phoenix.LiveViewTest
  import Survey.OpdsFixtures

  @create_attrs %{kode_bidang_urusan: "some kode_bidang_urusan", nama_bidang_urusan: "some nama_bidang_urusan", aktif: true}
  @update_attrs %{kode_bidang_urusan: "some updated kode_bidang_urusan", nama_bidang_urusan: "some updated nama_bidang_urusan", aktif: false}
  @invalid_attrs %{kode_bidang_urusan: nil, nama_bidang_urusan: nil, aktif: false}

  defp create_bidang_urusan(_) do
    bidang_urusan = bidang_urusan_fixture()
    %{bidang_urusan: bidang_urusan}
  end

  describe "Index" do
    setup [:create_bidang_urusan]

    test "lists all bidang_urusans", %{conn: conn, bidang_urusan: bidang_urusan} do
      {:ok, _index_live, html} = live(conn, ~p"/bidang_urusans")

      assert html =~ "Listing Bidang urusans"
      assert html =~ bidang_urusan.kode_bidang_urusan
    end

    test "saves new bidang_urusan", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/bidang_urusans")

      assert index_live |> element("a", "New Bidang urusan") |> render_click() =~
               "New Bidang urusan"

      assert_patch(index_live, ~p"/bidang_urusans/new")

      assert index_live
             |> form("#bidang_urusan-form", bidang_urusan: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#bidang_urusan-form", bidang_urusan: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/bidang_urusans")

      html = render(index_live)
      assert html =~ "Bidang urusan created successfully"
      assert html =~ "some kode_bidang_urusan"
    end

    test "updates bidang_urusan in listing", %{conn: conn, bidang_urusan: bidang_urusan} do
      {:ok, index_live, _html} = live(conn, ~p"/bidang_urusans")

      assert index_live |> element("#bidang_urusans-#{bidang_urusan.id} a", "Edit") |> render_click() =~
               "Edit Bidang urusan"

      assert_patch(index_live, ~p"/bidang_urusans/#{bidang_urusan}/edit")

      assert index_live
             |> form("#bidang_urusan-form", bidang_urusan: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#bidang_urusan-form", bidang_urusan: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/bidang_urusans")

      html = render(index_live)
      assert html =~ "Bidang urusan updated successfully"
      assert html =~ "some updated kode_bidang_urusan"
    end

    test "deletes bidang_urusan in listing", %{conn: conn, bidang_urusan: bidang_urusan} do
      {:ok, index_live, _html} = live(conn, ~p"/bidang_urusans")

      assert index_live |> element("#bidang_urusans-#{bidang_urusan.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#bidang_urusans-#{bidang_urusan.id}")
    end
  end

  describe "Show" do
    setup [:create_bidang_urusan]

    test "displays bidang_urusan", %{conn: conn, bidang_urusan: bidang_urusan} do
      {:ok, _show_live, html} = live(conn, ~p"/bidang_urusans/#{bidang_urusan}")

      assert html =~ "Show Bidang urusan"
      assert html =~ bidang_urusan.kode_bidang_urusan
    end

    test "updates bidang_urusan within modal", %{conn: conn, bidang_urusan: bidang_urusan} do
      {:ok, show_live, _html} = live(conn, ~p"/bidang_urusans/#{bidang_urusan}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Bidang urusan"

      assert_patch(show_live, ~p"/bidang_urusans/#{bidang_urusan}/show/edit")

      assert show_live
             |> form("#bidang_urusan-form", bidang_urusan: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#bidang_urusan-form", bidang_urusan: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/bidang_urusans/#{bidang_urusan}")

      html = render(show_live)
      assert html =~ "Bidang urusan updated successfully"
      assert html =~ "some updated kode_bidang_urusan"
    end
  end
end
