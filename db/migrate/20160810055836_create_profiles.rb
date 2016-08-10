class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :second_name
      t.string :last_name
      t.string :adress
      t.string :city
      t.string :state
      t.date :birthday
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
