class CreateUtilizes < ActiveRecord::Migration
  def change
    create_table :utilizes do |t|
      t.references :project, index: true, foreign_key: true
      t.references :tech, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
