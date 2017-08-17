class AddUserToTransferences < ActiveRecord::Migration
  def change
    add_reference :transferences, :user, index: true, foreign_key: true
  end
end
