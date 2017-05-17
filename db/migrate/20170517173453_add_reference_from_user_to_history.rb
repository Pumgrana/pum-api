class AddReferenceFromUserToHistory < ActiveRecord::Migration[5.0]
  def change
    add_reference :histories, :user
  end
end
