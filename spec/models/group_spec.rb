# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:all) do
    @user = User.create(id: 1, name: 'some name', email: 'some@email.com', password: 'some password')
    @subject = Group.new(name: 'some category', user_id: @user.id)
    @subject.icon.attach(io: File.open("#{Rails.root}/app/assets/images/image.jpg"), filename: 'image.jpg')
    @subject.save
  end

  after(:all) do
    @user.delete
    @subject.delete
  end

  it 'should be valid' do
    expect(@subject).to be_valid
  end

  it 'name should be present' do
    @subject.name = nil
    expect(@subject).to_not be_valid
  end

  it 'icon should be present' do
    @subject.icon = nil
    expect(@subject).to_not be_valid
  end
end
