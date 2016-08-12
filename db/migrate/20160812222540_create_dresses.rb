class CreateDresses < ActiveRecord::Migration[5.0]
  def change
    create_table :dresses do |t|
      t.string :color
      t.string :size
      t.string :length
      t.string :type
      t.string :neckline
      t.string :status

      t.timestamps
    end
  end
end
