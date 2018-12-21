class CreateTeches < ActiveRecord::Migration
  def change
    create_table :teches do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
