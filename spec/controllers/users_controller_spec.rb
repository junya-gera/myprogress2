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

  describe 'GET #index' do
    it "@tweetに正しい値が入っていること" do
    end

    it "index.html.erbに遷移すること" do
    end
  end

end