class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :types, array: true, default: []
      t.float :price_per_day
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
