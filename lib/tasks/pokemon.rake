namespace :load do
  desc 'Create Pokemon'
  task pokemon: :environment do
    Pokemon.destroy_all

    all_pokemon = PokemonService.get_all_pokemon
    all_pokemon[:results].map do |pokemon|
      Pokemon.create!(name: pokemon[:name])
    end 

    def gather_pokemon_abilities(pokemon_abilities)
      pokemon_abilities.reduce("") do |all_abilities, pokemon_ability|
        all_abilities + " " + pokemon_ability[:ability][:name]
      end
    end

    def gather_pokemon_moves(pokemon_forms)
      pokemon_forms.reduce("") do |all_forms, one_form|
        all_forms + " " + one_form[:name]
      end
    end
    
    def gather_pokemon_forms(pokemon_moves)
      pokemon_moves.reduce("") do |all_moves, move|
        all_moves + " " + move[:move][:name]
      end
    end

    Pokemon.all.each do |pokemon|
      pokemon_details = PokemonService.get_pokemon_details(pokemon.name)
      Pokemon.update(height: pokemon_details[:height],
                    weight: pokemon_details[:weight],
                    abilities: gather_pokemon_abilities(pokemon_details[:abilities]),
                    forms: gather_pokemon_moves(pokemon_details[:forms]),
                    moves: gather_pokemon_forms(pokemon_details[:moves]))
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('pokemon')
  end
end