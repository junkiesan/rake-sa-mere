class AddUserReferenceToCat < ActiveRecord::Migration[6.0]
  def change
    add_reference :cats, :user, foreign_key: true
  end
end
