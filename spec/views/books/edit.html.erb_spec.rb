require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  let(:author) { Author.create(first_name: 'Jon', last_name: 'Snow', active: true) }

  before(:each) do
    @book = assign(:book, Book.create!(
      :title => "MyString",
      :description => "MyString",
      :author => author
    ))
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(@book), "post" do

      assert_select "input[name=?]", "book[title]"

      assert_select "input[name=?]", "book[description]"

      assert_select "input[name=?]", "book[author_id]"
    end
  end
end
