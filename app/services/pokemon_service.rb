class PokemonService
  def self.get_all_pokemon
    response = conn.get("/api/v2/pokemon?limit=150")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_pokemon_details(name)
    response = conn.get("/api/v2/pokemon/#{name}/")
    if (200..300) === response.status
      JSON.parse(response.body, symbolize_names: true)
    elsif response.status == 404
      response.body
    else #for ex. 503 service unavailable
      "Something went wrong"
    end
  end

  private
  def self.conn
    Faraday.new(url: "https://pokeapi.co") 
  end
end