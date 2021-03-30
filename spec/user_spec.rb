require 'users'

describe Users do

describe "#sign_up" do
  it 'takes a name and password as argument and adds to database' do
    con = PG.connect(dbname: ENV['TEST_NAME'])
    Users.sign_up("Max", "test")
    result = con.exec("Select * FROM users")
    result.select {|k, v| v == "Max"}
  end
end

  it 'has a name' do
    con = PG.connect(dbname: ENV['TEST_NAME'])
    con.exec("INSERT INTO users (username, password) VALUES('Max', 'test');")
    expect(Users.name).to eq("Max")
  end



end
