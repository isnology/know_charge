class CreateAdapters < ActiveRecord::Migration[5.1]
  def change
    create_table :adapters do |t|
      t.string :to_plug

      t.timestamps
    end
  end
end
