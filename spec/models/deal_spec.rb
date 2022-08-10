# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Deal, type: :model do
  before(:all) do
    @user = User.create(id: 1, name: 'some name', email: 'some@email.com', password: 'some password')

    @subject = Group.new(name: 'some category', user_id: @user.id)
    @subject.icon.attach(io: File.open("#{Rails.root}/app/assets/images/image.jpg"), filename: 'image.jpg')
    @subject.save

    @deal = Deal.new(name: 'some deal', amount: 100, user_id: @user.id)
    @deal.groups << @subject
  end

  it 'should be valid' do
    expect(@deal).to be_valid
  end

  it 'name should be present' do
    @deal.name = nil
    expect(@deal).to_not be_valid
  end

  it 'amount should be present' do
    @deal.amount = nil
    expect(@deal).to_not be_valid
  end

  it 'should have at least one category' do
    @deal.groups = []
    expect(@deal).to_not be_valid
  end
end
