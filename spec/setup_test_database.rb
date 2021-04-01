require 'pg'

def setup_test_database
  connection = PG.connect :dbname => ENV['TEST_NAME']
  # connection.exec("TRUNCATE bookings;")
  # connection.exec("TRUNCATE spaces;")
  connection.exec("TRUNCATE users CASCADE;")
  # connection.exec("TRUNCATE dates_available;")
  #connection.exec("TRUNCATE spaces CASCADE;")
end
