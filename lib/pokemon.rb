require 'pry'

class Pokemon
    attr_accessor :name, :type, :db
    attr_reader :id

    @@all_pokemons = []

    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES(?, ?)
        SQL
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        find_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
        self.new(id: find_pokemon[0][0] , name: find_pokemon[0][1], type: find_pokemon[0][2], db:db)
       
        #binding.pry
    end

end
