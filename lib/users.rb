describe Users do

  it 'has a name' do
    con = PG.connect(dbname: ENV['TEST_NAME'])
    PG.exec("INSERT INTO users (username, password) VALUES('Max', 'test');")
    expect(Users.name).to eq("Max")
  end

end
