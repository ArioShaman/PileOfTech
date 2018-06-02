class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title           , null: false
      t.string :description     , null: false
      t.boolean :status         , null: false, default: true
      t.string :kind
      t.string :link

      t.string :small_cover     , null: false
      
      t.integer :order, default: 0
      t.timestamps
    end
  end
end
