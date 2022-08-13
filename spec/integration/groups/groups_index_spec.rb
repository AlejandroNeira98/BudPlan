require 'rails_helper'

RSpec.describe 'Groups Index Page', type: :system do
  before(:all) do
    @user = User.create(id: 1, name: 'some name', email: 'some@email.com', password: 'some password')

    @subject = Group.new(id: 1, name: 'some category', user_id: @user.id)
    @subject.icon.attach(io: File.open("#{Rails.root}/app/assets/images/image.jpg"), filename: 'image.jpg')
    @subject.save

    @deal = Deal.new(name: 'some deal', amount: 100, user_id: @user.id)
    @deal.groups << @subject
    @deal.save

    visit 'users/sign_in'
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  before :each do
    visit '/groups/index'
  end

  it 'Shows the category name' do
    expect(page).to have_content('some category')
  end

  it 'Shows the amount' do
    find_link(href: "/groups/show/1").click
    expect(page).to have_content(@subject.name) && have_content(@deal.amount)
  end
end
