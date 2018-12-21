class AddTypeColumnToTech < ActiveRecord::Migration
  def change
    add_column :teches, :type, :string
  end
end
