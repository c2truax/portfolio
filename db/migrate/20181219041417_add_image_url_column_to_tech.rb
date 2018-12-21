class AddImageUrlColumnToTech < ActiveRecord::Migration
  def change
    add_column :teches, :image_url, :string
  end
end
