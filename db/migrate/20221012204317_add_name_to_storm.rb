class AddNameToStorm < ActiveRecord::Migration[5.2]
  def change
    add_column :storms, :name, :string
  end
end
