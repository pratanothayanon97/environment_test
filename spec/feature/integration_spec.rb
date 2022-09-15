# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'JKRowling'
    fill_in 'Price', with: 20
    select '2018', :from => 'book_published_1i'
    select 'December', :from => 'book_published_2i'
    select '4', :from => 'book_published_3i'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('JKRowling')
  end

  scenario 'valid price' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'JKRowling'
    fill_in 'Price', with: 20
    select '2018', :from => 'book_published_1i'
    select 'December', :from => 'book_published_2i'
    select '4', :from => 'book_published_3i'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content(20)
  end

  scenario 'valid published date' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'JKRowling'
    fill_in 'Price', with: 20
    select '2018', :from => 'book_published_1i'
    select 'December', :from => 'book_published_2i'
    select '4', :from => 'book_published_3i'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('2018-12-04')
  end

end