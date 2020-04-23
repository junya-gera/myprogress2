require 'rails_helper'

describe UsersController do
  describe 'GET #edit' do
    it "edit.html.erbに遷移すること" do
      get :edit,
      expect(response).to render_template :edit

    end
  end

end