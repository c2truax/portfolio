class AddBioColumnToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :bio, :string
  end
end
