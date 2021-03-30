require 'users'

describe Users do

describe "#sign_up" do
  it 'takes a name and password as argument and adds to database' do
    con = PG.connect(dbname: ENV['TEST_NAME'])
    Users.sign_up("Max", "test")
    result = con.exec("Select * FROM users")
    name = result.map { |row| row['username']  }
    expect(name.first).to eq("Max")
  end
end

  it 'can load user data from the database' do
    con = PG.connect(dbname: ENV['TEST_NAME'])
    con.exec("INSERT INTO users (username, password) VALUES('Max', 'test');")
    expect(Users.user('Max')).to include("username" => "Max")
  end



end
