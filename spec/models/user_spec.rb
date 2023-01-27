require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Testing user without name' do
    user = User.create
    expect(user).to_not be_valid
  end

  it 'Testing user PostCounter number negative' do
    user = User.create(Name: 'John', Image: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'anything')
    user.PostCounter = -10
    expect(user).to_not be_valid
  end
end
