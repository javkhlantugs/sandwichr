class AddNameToSandwiches < ActiveRecord::Migration[5.0]
  def change
    add_column :sandwiches, :name, :string
  end
end
