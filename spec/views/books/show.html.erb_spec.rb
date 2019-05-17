require 'rails_helper'

RSpec.describe "books/show", type: :view do
  let(:author) { Author.create(first_name: 'Jon', last_name: 'Snow', active: true) }

  before(:each) do
    @book = assign(:book, Book.create!(
      :title => "Title",
      :description => "Description",
      :author => author
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
  end
end
