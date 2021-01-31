require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'before_action' do
    describe 'set_user' do
      it 'is expected to define before action' do
        is_expected.to use_before_action(:set_user)
      end
    end
  end

   # index action
  describe '#index' do
    before do
      get :index
    end

    it 'is expected to assign user instance variable' do
      expect(assigns[:users]).to eq(User.all)
    end
  end

  # new action
  describe '#new' do
    before do
      get :new
    end
  
    it 'is expected to assign user as new instance variable' do
      expect(assigns[:user]).to be_instance_of(User)
    end
  
    it 'renders new template' do
      is_expected.to render_template(:new)
    end
  end

  # create action
  describe '#create' do
    before do
      post :create, params: params
    end

    context 'when params are correct' do
      let(:params) { { user: { name: "Junkiesan" } } }

      it 'is expected to create new user successfully' do
        expect(assigns[:user]).to be_instance_of(User)
      end

      it 'is expected to have name assigned to it' do
        expect(assigns[:user].name).to eq('Junkiesan')
      end

      it 'is expected to redirect to users path' do
        is_expected.to redirect_to users_path
      end

      it 'is expected to set flash message' do
        expect(flash[:notice]).to eq('User Created Successfully.')
      end
    end

    context 'when params are not correct' do
      let(:params) { { user: { name: '' } } }

      it 'is expected to render new template' do
        is_expected.to render_template(:new)
      end

      it 'is expected to add errors to name attribute' do
        expect(assigns[:user].errors[:name]).to eq(['can\'t be blank'])
      end
    end
  end

  # edit action
  describe '#edit' do
    before do
      get :edit, params: params
    end

    context 'when user id is valid' do
      let(:user) { FactoryBot.create :user }
      let(:params) { { id: user.id } }

      it 'is expected to set user instance variable' do
        expect(assigns[:user]).to eq(User.find_by(id: params[:id]))
      end

      it 'is expected to render edit template' do
        is_expected.to render_template(:edit)
      end
    end

    context 'when user id is invalid' do
      let(:params) { { id: Faker::Number.number } }

      it 'is expected to redirect_to users path' do
        is_expected.to redirect_to(users_path)
      end

      it 'is expected to set flash' do
        expect(flash[:notice]).to eq('User not found.')
      end
    end
  end

  # update action
  describe '#update' do

    before do
      patch :update, params: params
    end

    context 'when user not found' do
      let(:params) { { id: Faker::Number.number } }

      it 'is expected to redirect_to users path' do
        is_expected.to redirect_to(users_path)
      end

      it 'is expected to set flash' do
        expect(flash[:notice]).to eq('User not found.')
      end
    end

    context 'when user exist in database' do
      let(:user) { FactoryBot.create :user }
      let(:params) { { id: user.id, user: { name: 'test name' } } }

      context 'when data is provided is valid' do
        it 'is expected to update user' do
          expect(user.reload.name).to eq('test name')
        end

        it 'is_expected to redirect_to users_path' do
          is_expected.to redirect_to(users_path)
        end

        it 'is expected to set flash message' do
          expect(flash[:notice]).to eq('User has been updated Successfully.')
        end
      end

      context 'when data is invalid' do
        let(:user) { FactoryBot.create :user }
        let(:params) { { id: user.id, user: { name: '' } } }

        it 'is expected not to update user name' do
          expect(user.reload.name).not_to be_empty
        end

        it 'is expected to render edit template' do
          expect(response).to render_template(:edit)
        end

        it 'is expected to add errors to user name attribute' do
          expect(assigns[:user].errors[:name]).to eq(['can\'t be blank'])
        end
      end
    end
  end
end
