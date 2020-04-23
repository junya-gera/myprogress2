require 'rails_helper'

describe UsersController do

  describe 'GET #edit' do
    it "@userに正しい値が入っていること" do
      user = create(:user)
      get :edit, params: { id: user }
      expect(assigns(:user)).to eq user
    end

    it "edit.html.erbに遷移すること" do
      user = create(:user)
      get :edit, params: { id: user }
      expect(response).to render_template :edit
    end
  end


  describe 'GET #show' do
    it "@userに正しい値が入っていること" do
      user = create(:user)
      get :show, params: { id: user }
      expect(assigns(:user)).to eq user
    end

    it "show.html.erbに遷移すること" do
      user = create(:user)
      get :show, params: { id: user }
      expect(response).to render_template :show
    end
  end


  describe 'GET #index' do
    it "@usersに正しい値が入っていること" do
      users = create_list(:user, 3) 
      get :index
      expect(assigns(:users)).to match(users)
    end

    it "index.html.erbに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end

end