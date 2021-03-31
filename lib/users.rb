class Users
  attr_reader :id, :username, :password

  def initialize(id, username, password)
    @id = id
    @username = username
    @password = password
  end


  def self.sign_up(username, password)
    con = setup_connection
    con.exec("INSERT INTO users (username, password) VALUES('#{username}', '#{password}');")
  end

  def self.user(username)
    con = setup_connection
    result = con.exec("SELECT * FROM users WHERE username='#{username}'; ").first
    p  Users.new(result['id'], result['username'], result['password'])
  end

# Test failing due to not being able to test enumerator object.
# It might be a solution to use .first at the end of linie 18
# Equally the test might need to be rewritten in order to pass
# Tried calling .username attribute to return the username but it didn't like the method



private
  def self.setup_connection
    if ENV['ENVIRONMENT'] == "test"
      PG.connect(dbname: ENV['TEST_NAME'])
    else
      PG.connect(dbname: ENV['PROD_NAME'])
    end
  end
end
