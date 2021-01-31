require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'before actions' do
    describe 'set_user' do
      it 'is expected to define before action' do
        is_expected.to use_before_action(:set_user)
      end
    end
  end

   # index action
   describe 'GET #index' do
    before do
      get :index
    end

    it 'is expected to assign user instance variable' do
      expect(assigns[:users]).to eq(User.all)
    end
  end

end
