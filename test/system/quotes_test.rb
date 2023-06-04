require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase

  # テストデータをセット
  setup do
    @quote = quotes(:first)
  end

  test "Creating a new quote" do
    # Quotesのindexページにアクセスしたとき "Quotes "というテキストを持つタイトルが表示される
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    # "New quote" というテキストを持つリンクをクリックすると、"New quote "というタイトルのページが表示される
    # "New quote" というタイトルのページが表示される
    click_on "New quote"
    assert_selector "h1", text: "New quote"


    # 名前入力に "Capybara quote "と記入し、"Create quote "をクリックすると
    fill_in "Name", with: "Capybara quote"
    click_on "Create quote"

    # Quotesというタイトルでページに戻り、私たちの "Capybara quote" が追加されることを期待しています
    assert_selector "h1", text: "Quotes"
    assert_text "Capybara quote"
  end

  test "Showing a quote" do
    visit quotes_path
    click_link @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "Updating a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit quote"

    fill_in "Name", with: "Updated quote"
    click_on "Update quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Updated quote"
  end

  test "Destroying a quote" do
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end

end