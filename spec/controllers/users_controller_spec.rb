require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'before actions' do
    describe 'set_user' do
      it 'is expected to define before action' do
        is_expected.to use_before_action(:set_user)
      end
    end
  end

end
