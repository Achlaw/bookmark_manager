require 'capybara'
require 'capybara/rspec'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
require_relative '../../app/models/link'

feature 'Homepage displays links' do
  scenario 'viewing links' do
    Link.create(url: 'http://google.com', title: 'Google')
    p Link.all
    visit '/links'
    expect(page).to have_content('http://google.com')
  end
end
