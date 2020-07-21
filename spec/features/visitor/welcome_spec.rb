require 'rails_helper'

describe 'Visitor Welcome Page' do
  it 'I can see the I Scream Aracade title' do
    visit '/'
    expect(page).to have_css('.masthead')
  end
end