class Bookings

  attr_reader :id, :space_id, :date

  def initialize(id, space_id, date)
    @id = id
    @space_id = space_id
    @date = date
  end

  def self.add_booking(booking)
    con = setup_connection
    space_id = booking.space_id
    date = booking.date
    con.exec("INSERT INTO bookings (space_id, date) VALUES('#{space_id}', '#{date}');")
    con.close
  end

  def self.add_date_available(space_id, date)
    con = setup_connection
    con.exec("INSERT INTO dates_available (space_id, date) VALUES('#{space_id}', '#{date}');")
    con.close
  end

  def self.bookings(space_id)
    con = setup_connection
    result = con.exec("SELECT * FROM bookings WHERE space_id='#{space_id}';")
    con.close
    result.map do |row|
      Bookings.new(row['id'], row['space_id'], row['date'])
    end
  end

  def self.available_dates(bookings)
    @dates = []
    bookings.each do |booking|
      @dates << booking.date
    end
    @dates
  end

  def self.approve_booking(bookings)
    bookings.each do |booking|
      add_booking(booking)
      space_id = booking.space_id
      date = booking.date
      remove_date_available(space_id, date)
      remove_request(space_id, date)
    end
  end

  def self.remove_date_available(space_id, date)
    con = setup_connection
    con.exec("DELETE FROM dates_available WHERE space_id='#{space_id}' AND date='#{date}';")
  end

  def self.remove_request(space_id, date)
    con = setup_connection
    con.exec("DELETE FROM requests WHERE space_id='#{space_id}' AND date='#{date}';")
  end

  def self.request_booking(bookings)
    con = setup_connection
    bookings.each do |booking|
      space_id = booking.space_id
      date = booking.date
      con.exec("INSERT INTO requests (space_id, date) VALUES('#{space_id}', '#{date}');")
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
