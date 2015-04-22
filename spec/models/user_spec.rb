require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user){User.new(first_name: "Tracy", last_name: "Caruso", username: "ycart", password: "michelle", password_confirmation: "michelle")}

  it 'is not valid without first name' do
    user.first_name = nil
    expect(user).not_to be_valid
  end

  it 'is not valid without last name' do
    user.last_name = nil
    expect(user).not_to be_valid
  end

  it 'is not valid without username' do
    user.username = nil
    expect(user).not_to be_valid
  end

  it 'is valid without password' do
    user.password = nil
    expect(user).not_to be_valid
  end

  it 'is valid without password confirmation' do
    user.password_confirmation = nil
    expect(user).not_to be_valid
  end

end
