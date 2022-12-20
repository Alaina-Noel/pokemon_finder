class PokemonController< ApplicationController
  def index
    @pokemon = Pokemon.all
      if params[:sort]
        @pokemon = @pokemon.sort_by {|pokemon| pokemon.name }
      end
    end
end