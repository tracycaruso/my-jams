require 'rails_helper'


RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) {
    {first_name:"Tracy", last_name:"Caruso", username:"ycart", password:"michelle", password_confirmation:"michelle"}
  }

  let(:invalid_attributes) {
    {first_name: nil, last_name: nil, username: nil, password: nil, password_confirmation: nil}
  }
  let(:valid_session){{}}
    # users POST    /users(.:format)          users#create
    # new_user GET  /users/new(.:format)      users#new
    # user GET      /users/:id(.:format)      users#show

  describe "GET #new" do
    it "assigns a new user as @user" do
      get :new, {}, valid_session
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST #create" do
  context "with valid params" do
    it "creates a new User" do
      expect {
        post :create, {:user => valid_attributes}, valid_session
      }.to change(User, :count).by(1)
    end

    it "assigns a newly created user as @user" do
      post :create, {:user => valid_attributes}, valid_session
      expect(assigns(:user)).to be_a(User)
      expect(assigns(:user)).to be_persisted
    end

    it "redirects to the created user" do
      post :create, {:user => valid_attributes}, valid_session
      expect(response).to redirect_to(User.last)
    end
  end

  context "with invalid params" do
    it "assigns a newly created but unsaved user as @user" do
      post :create, {:user => invalid_attributes}, valid_session
      expect(assigns(:user)).to be_a_new(User)
    end

    it "re-renders the 'new' template" do
      post :create, {:user => invalid_attributes}, valid_session
      expect(response).to render_template("new")
    end
  end
end

end
