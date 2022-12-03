class AddPosterUrl < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :poster_url, :string
  end
end
