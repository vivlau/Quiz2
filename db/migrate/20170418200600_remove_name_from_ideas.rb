class RemoveNameFromIdeas < ActiveRecord::Migration[5.0]
  def change
    remove_column :ideas, :name, :string
  end
end
