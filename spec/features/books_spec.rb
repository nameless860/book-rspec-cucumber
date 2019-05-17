require 'rails_helper'

RSpec.feature "Books", type: :feature do
  let(:author) { Author.create(first_name: 'Jon', last_name: 'Snow', active: true) }

  context 'create new book' do

    before(:each) {
      visit new_book_path

      within("form") do
        fill_in 'Description', with: 'Great!'
        fill_in 'Author', with: author.id
      end
    }

    scenario 'should be successful' do

      within("form") do
        fill_in 'Title', with: 'Game of Thrones'
      end

      click_button 'Create Book'
      expect(page).to have_content('Book was successfully created')
    end

    scenario 'should fail' do
      click_button 'Create Book'
      expect(page).to have_content("Title can't be blank")
    end
  end

  context 'update book' do
    scenario 'should be successful' do
      book = Book.create(title: 'haha', description: 'kaka', author: author)
      visit edit_book_path(book)
      within("form") do
        fill_in 'Title', with: 'Sucker'
      end

      click_button 'Update Book'
      expect(page).to have_content('Book was successfully updated.')
      expect(page).to have_content("Sucker")
    end
  end


  context 'delete book' do
    scenario 'should be successful' do
      book = Book.create(title: 'haha', description: 'kaka', author: author)
      visit books_path
      expect { click_link 'Destroy' }.to change(Book, :count).by(-1)
    end
  end
end
