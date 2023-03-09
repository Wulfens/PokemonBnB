class AddCoordinatesToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :latitude, :float
    add_column :pokemons, :longitude, :float
    add_column :pokemons, :address, :string

  end
end
