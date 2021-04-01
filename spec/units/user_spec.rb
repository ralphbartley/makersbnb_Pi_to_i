require 'users'

describe Users do

  describe '.sign_up' do
    it 'takes a name and password as argument and adds to database' do
      con = PG.connect(dbname: ENV['TEST_NAME'])
      Users.sign_up("Test", "password")
      result = con.exec("Select * FROM users")
      con.close
      name = result.map { |row| row['username']  }
      expect(name.first).to eq("Test")
    end
  end

  describe '.user' do
    it 'can load user data from the database' do
      con = PG.connect(dbname: ENV['TEST_NAME'])
      con.exec("INSERT INTO users (username, password) VALUES('Max', 'test');")
      con.close
      new_user = Users.user('Max').username
      expect(new_user).to include("Max")
    end
  end
end
