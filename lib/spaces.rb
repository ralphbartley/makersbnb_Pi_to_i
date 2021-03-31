class Spaces

attr_reader :id, :name, :description, :daily_price, :owner_id

  def initialize(id, name, description, daily_price, owner_id)
    @id = id
    @name = name
    @description = description
    @daily_price = daily_price
    @owner_id = owner_id
  end


  def self.add(name, description, daily_price, owner_id)
    con = setup_connection
    con.exec("INSERT INTO spaces (name, description, daily_price, owner_id) VALUES('#{name}', '#{description}', '#{daily_price}', '#{owner_id}');")
  end

  def self.all
    con = setup_connection
    result = con.exec("SELECT * FROM spaces;")
    result.map do |result|
      Spaces.new(result['id'], result['name'], result['description'], result['daily_price'], result['owner_id'])
    end
  end


private
  def self.setup_connection
    if ENV['ENVIRONMENT'] == "test"
      PG.connect(dbname: ENV['TEST_NAME'])
    else
      PG.connect(dbname: ENV['PROD_NAME'])
    end
  end
end
