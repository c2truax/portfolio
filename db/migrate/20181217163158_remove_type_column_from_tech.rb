class RemoveTypeColumnFromTech < ActiveRecord::Migration
  def change
    remove_column :teches, :type, :string
  end
end
