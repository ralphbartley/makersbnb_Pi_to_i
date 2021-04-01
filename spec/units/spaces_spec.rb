require 'spaces'

describe Spaces do

  describe '.add' do

    it 'takes id, name, description, price, owner_id(users) and adds to database' do
      con = PG.connect(dbname: ENV['TEST_NAME'])
      Users.sign_up("Max", "test")
      owner_id = Users.user("Max").id
      Spaces.add("name", "description", 40, owner_id)
      result = con.exec("SELECT * FROM spaces WHERE name='name';")
      con.close
      space = result.first
      expect(space).to include({ "name" => "name", "description" => "description", "daily_price" => "40" })
    end
  end

  describe '.all' do
    it 'lists all spaces and wraps name, description price, owner_id in objects' do
      Users.sign_up("Max", "test")
      owner_id = Users.user("Max").id
      Spaces.add("name", "description", 40, owner_id)

      spaces = Spaces.all
      spaces.each do |space|
        @new_space = space if space.description == "description"
      end
      expect(@new_space.description).to include("description")
      expect(@new_space.name).to include("name")
      expect(@new_space.daily_price).to include("40")

    end
  end

end
