require 'rails_helper'

RSpec.describe "books/index", type: :view do
  let(:author) { Author.create(first_name: 'Jon', last_name: 'Snow', active: true) }

  before(:each) do
    assign(:books, [
      Book.create!(
        :title => "Title",
        :description => "Description",
        :author => author
      ),
      Book.create!(
        :title => "Title",
        :description => "Description",
        :author => author
      )
    ])
  end

  # it "renders a list of books" do
  #   render
  #   assert_select "tr>td", :text => "Title".to_s, :count => 2
  #   assert_select "tr>td", :text => "Description".to_s, :count => 2
  #   assert_select "tr>td", :text => nil.to_s, :count => 2
  # end
end
