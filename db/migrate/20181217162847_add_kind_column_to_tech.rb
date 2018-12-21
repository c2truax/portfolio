class AddKindColumnToTech < ActiveRecord::Migration
  def change
    add_column :teches, :kind, :string
  end
end
