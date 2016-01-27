class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :code
      t.string :kind_of
      t.string :ancestry
      t.timestamps null: false
    end

    add_index :places, :ancestry
  end
end
