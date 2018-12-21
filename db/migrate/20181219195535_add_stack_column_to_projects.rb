class AddStackColumnToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :stack, :string
  end
end
