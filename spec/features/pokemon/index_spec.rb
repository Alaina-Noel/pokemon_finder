require 'rails_helper'

RSpec.describe 'pokemon index page', type: :feature do
  describe 'As a visitor' do
    describe 'When I visit the show page' do

      it 'I can see all pokemon listed' do
        pokemon_1 = create(:pokemon)
        pokemon_2 = create(:pokemon)
        pokemon_3 = create(:pokemon)
        visit '/index'

        expect(page).to have_content("#{pokemon_1.name}")
        expect(page).to have_content("#{pokemon_2.name}")
        expect(page).to have_content("#{pokemon_3.name}")
      end

      it 'When I click the sort button they are sorted alphabetically' do
        pokemon_1 = create(:pokemon)
        pokemon_2 = create(:pokemon)
        pokemon_3 = create(:pokemon)
        visit '/index'
        click_on('sort alphabetically')

        alpha_ordered_list = [pokemon_1, pokemon_2, pokemon_3].sort_by {|pokemon| pokemon.name}
        expect(alpha_ordered_list[0].name).to appear_before(alpha_ordered_list[1].name)
        expect(alpha_ordered_list[1].name).to appear_before(alpha_ordered_list[2].name)
      end
    end
  end
end