class Users



  def self.sign_up(username, password)
    con = setup_connection
    con.exec("INSERT INTO users (username, password) VALUES('#{username}', '#{password}');")
  end

  def self.user(username)
    con = setup_connection
    con.exec("SELECT * FROM users WHERE username='#{username}'; ").first
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
