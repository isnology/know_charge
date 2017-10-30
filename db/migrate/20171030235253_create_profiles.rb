class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :street_number
      t.string :street
      t.string :city
      t.string :state
      t.text :image_data
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
