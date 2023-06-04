require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
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
end