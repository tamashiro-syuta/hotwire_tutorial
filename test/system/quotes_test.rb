require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase

  # テストデータをセット
  setup do
    @quote = quotes(:first)
  end

  test "Showing a quote" do
    visit quotes_path                       # quotes_path にアクセスして
    click_link @quote.name                  # 名前をクリックすると

    assert_selector "h1", text: @quote.name # h1タグに名前が表示されることをテスト
  end

  test "Creating a new quote" do
    visit quotes_path                      # quotes_path にアクセスすると
    assert_selector "h1", text: "Quotes"   # ページ上に「Quotes」というテキストを含むh1要素が存在することをテスト

    click_on "New quote"                   # New quote ボタンをクリックして
    fill_in "Name", with: "Capybara quote" # フォームの Name に Capybara quote と入力すると

    assert_selector "h1", text: "Quotes"   # 「Quotes」というテキストを含むh1要素が存在することをテスト
    click_on "Create quote"                # Create quote ボタンをクリックすると

    assert_selector "h1", text: "Quotes"   # 「Quotes」というテキストを含むh1要素が存在することをテスト
    assert_text "Capybara quote"           # ページ上に「Capybara quote」というテキストが表示されていることをテスト
  end

  test "Updating a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "Edit", match: :first
    fill_in "Name", with: "Updated quote"

    assert_selector "h1", text: "Quotes"
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