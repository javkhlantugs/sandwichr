class AddBreadTypeToSandwiches < ActiveRecord::Migration[5.0]
  def change
    add_column :sandwiches, :bread_type, :string
  end
end
