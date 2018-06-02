class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :image, null: false
      t.belongs_to :project
      t.timestamps

      t.timestamps
    end
  end
end
