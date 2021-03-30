def setup_test_database
  connection = PG.connect :dbname => ‘makersbnb_test’
  connection.exec(“TRUNCATE users;“)
  connection.exec(“TRUNCATE spaces;“)
  connection.exec(“TRUNCATE bookings;“)
  connection.exec(“TRUNCATE dates_available;“)
end
