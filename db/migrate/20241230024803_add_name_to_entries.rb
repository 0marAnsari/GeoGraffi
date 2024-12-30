class AddNameToEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :name, :string
  end
end
