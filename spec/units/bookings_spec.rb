require 'bookings'

describe Bookings do

  describe '.add_booking' do

    it 'adds a booking to the database with space_id and date' do
      con = PG.connect(dbname: ENV['TEST_NAME'])
      Users.sign_up("Max", "test")
      owner_id = Users.user("Max").id
      Spaces.add("name", "description", 40, owner_id)

      spaces = Spaces.all
      spaces.each do |just_added|
        @space = just_added if just_added.description == "description"
      end

      Bookings.add_booking(Bookings.new(nil, @space.id, 4))
      space_id = @space.id
      result = con.exec("SELECT * FROM bookings WHERE space_id='#{space_id}';")
      con.close
      expect(result.first).to include({"date" => "4"})
    end
  end

  describe '.bookings' do

    it 'retrieves all associated bookings of argument space_id' do
      Users.sign_up("Max", "test")
      owner_id = Users.user("Max").id
      Spaces.add("name", "description", 40, owner_id)

      spaces = Spaces.all
      spaces.each do |just_added|
        @space = just_added if just_added.description == "description"
      end
      space_id = @space.id

      Bookings.add_booking(Bookings.new(nil, space_id, 4))
      Bookings.add_booking(Bookings.new(nil, space_id, 5))

      expect(Bookings.bookings(@space.id).first.date).to eq("4")
      expect(Bookings.bookings(@space.id).last.date).to eq("5")
    end
  end

  describe '.add_date_available' do

    it 'adds a date with space_id to dates_available' do
      Users.sign_up("Max", "test")
      owner_id = Users.user("Max").id
      Spaces.add("name", "description", 40, owner_id)

      spaces = Spaces.all
      spaces.each do |just_added|
        @space = just_added if just_added.description == "description"
      end
      space_id = @space.id

      Bookings.add_date_available(space_id, 4)

      con = PG.connect(dbname: ENV['TEST_NAME'])
      result = con.exec("SELECT * FROM dates_available WHERE space_id='#{space_id}';")
      con.close
      expect(result.first).to include({"date" => "4"})
    end
  end

  describe '.available_dates' do

    it 'returns an array of dates associated with a collection of bookings' do
      Users.sign_up("Max", "test")
      owner_id = Users.user("Max").id
      Spaces.add("name", "description", 40, owner_id)

      spaces = Spaces.all
      spaces.each do |just_added|
        @space = just_added if just_added.description == "description"
      end

      Bookings.add_booking(Bookings.new(nil, @space.id, 4))
      Bookings.add_booking(Bookings.new(nil, @space.id, 5))
      @bookings = Bookings.bookings(@space.id)
      expect(Bookings.available_dates(@bookings)).to eq(["4", "5"])
    end
  end

  describe '.approve_booking' do

    it 'adds bookings as a collection of Bookings objects' do
      Users.sign_up("Max", "test")
      owner_id = Users.user("Max").id
      Spaces.add("name", "description", 40, owner_id)

      spaces = Spaces.all
      spaces.each do |just_added|
        @space = just_added if just_added.description == "description"
      end
      space_id = @space.id

      @bookings = []
      @bookings << Bookings.new(nil, @space.id, 4)
      @bookings << Bookings.new(nil, @space.id, 5)

      Bookings.approve_booking(@bookings)

      expect(Bookings.bookings(space_id).first.date).to eq("4")
      expect(Bookings.bookings(space_id).last.date).to eq("5")
    end
  end

  describe '.remove_date_available' do

    it 'removes the date of argument space_id from dates_available' do
      Users.sign_up("Max", "test")
      owner_id = Users.user("Max").id
      Spaces.add("name", "description", 40, owner_id)

      spaces = Spaces.all
      spaces.each do |just_added|
        @space = just_added if just_added.description == "description"
      end
      space_id = @space.id

      Bookings.add_date_available(space_id, 4)
      Bookings.add_date_available(space_id, 5)

      Bookings.remove_date_available(space_id, 4)
      con = PG.connect(dbname: ENV['TEST_NAME'])
      result = con.exec("SELECT * FROM dates_available WHERE space_id='#{space_id}';")
      con.close
      expect(result.first).to include({"date" => "5"})
    end
  end

  describe '.remove_request' do

    it 'removes booking request with date of argument space_id from requests' do
      Users.sign_up("Max", "test")
      owner_id = Users.user("Max").id
      Spaces.add("name", "description", 40, owner_id)

      spaces = Spaces.all
      spaces.each do |just_added|
        @space = just_added if just_added.description == "description"
      end
      space_id = @space.id

      @bookings = []
      @bookings << Bookings.new(nil, space_id, 4)
      @bookings << Bookings.new(nil, space_id, 5)

      Bookings.request_booking(@bookings)

      Bookings.remove_request(space_id, 4)

      con = PG.connect(dbname: ENV['TEST_NAME'])
      result = con.exec("SELECT * FROM requests WHERE space_id='#{space_id}';")
      con.close
      expect(result.first).to include({"date" => "5"})
    end
  end

  describe '.request_booking' do

    it 'creates a booking request referencing space_id and giving date' do
      con = PG.connect(dbname: ENV['TEST_NAME'])
      Users.sign_up("Max", "test")
      owner_id = Users.user("Max").id
      Spaces.add("name", "description", 40, owner_id)

      spaces = Spaces.all
      spaces.each do |just_added|
        @space = just_added if just_added.description == "description"
      end
      space_id = @space.id

      @bookings = []
      @bookings << Bookings.new(nil, space_id, 4)
      @bookings << Bookings.new(nil, space_id, 5)

      Bookings.request_booking(@bookings)

      con = PG.connect(dbname: ENV['TEST_NAME'])
      result = con.exec("SELECT * FROM requests WHERE space_id='#{space_id}';")
      con.close
      expect(result.first).to include({"date" => "4"})
    end
  end
end
