require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id
  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @id = id
  end
  def self.save(name, type, database)
    # database = SQLite3::Database.new("/Users/michael/catalog.db")
    sql = <<-SQL
      INSERT INTO pokemon (name,type) VALUES (?,?)
    SQL
    database.execute(sql,name,type)
  end
  def self.find(id, database)
    # binding.pry
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = (?)
      SQL
    response = database.execute(sql, id)[0]
    Pokemon.new(name: response[1], type: response[2],db:  database, id: response[0])
  end
  # private
  # def self.format_sql(response)
  #   Pokemon.new(response[1], response[2], @db, response[0])
  # end

end
