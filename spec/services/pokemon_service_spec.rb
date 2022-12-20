require 'rails_helper'

describe PokemonService do
  context "class methods" do
    context "#get_all_pokemon" do
      it "returns all pokemon by name" do
        all_pokemon = PokemonService.get_all_pokemon
        expect(all_pokemon).to be_a Hash
        expect(all_pokemon[:results]).to be_an Array
        expect(all_pokemon[:results].count).to eq 150

        pokemon_list = all_pokemon[:results]

        pokemon_list.each do |pokemon|
          expect(pokemon).to have_key :name
          expect(pokemon[:name]).to be_a(String)
        end
      end
    end

    context '#get_pokemon_details(name)' do
      it 'returns the details of one pokemon' do
        pokemon_details = PokemonService.get_pokemon_details('pikachu')
        expect(pokemon_details).to be_a Hash

        expect(pokemon_details).to have_key :abilities
        expect(pokemon_details[:abilities]).to be_an Array
        expect(pokemon_details[:abilities].first[:ability][:name]).to be_a String

        expect(pokemon_details).to have_key :weight
        expect(pokemon_details[:weight]).to be_a Integer

        expect(pokemon_details).to have_key :height
        expect(pokemon_details[:height]).to be_a Integer

        expect(pokemon_details).to have_key :forms
        expect(pokemon_details[:forms]).to be_an Array
        expect(pokemon_details[:forms].first[:name]).to be_a String

        expect(pokemon_details).to have_key :moves
        expect(pokemon_details[:moves]).to be_an Array
        expect(pokemon_details[:moves].first[:move][:name]).to be_a String
      end
    end

    context '#get_pokemon_details(name)' do
      it 'returns an error if the pokemon is not found' do
        bad_response = PokemonService.get_pokemon_details('pika')
        expect(bad_response).to eq ("Not Found")
      end
    end

    context '#get_pokemon_details(name)' do
      it 'returns an error if the pokemon is not found' do
        allow(PokemonService).to receive(:get_pokemon_details).with('pikachu').and_return("Something went wrong")
        server_down = PokemonService.get_pokemon_details('pikachu')
        expect(server_down).to eq ("Something went wrong")
      end
    end
  end
end