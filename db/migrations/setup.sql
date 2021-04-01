\c makersbnb;

TRUNCATE users CASCADE;

INSERT INTO users VALUES('Test', 'password')
INSERT INTO users VALUES('Will', 'spencer')
INSERT INTO users VALUES('Ralph', 'bartley')
INSERT INTO users VALUES('Max', 'strivens')
INSERT INTO users VALUES('David', 'greaves')

INSERT INTO spaces VALUES('House', '4 bedrooms with swimming pool', '100', '1')
INSERT INTO spaces VALUES('Cottage', '3 bedrooms with a thatched roof', '156', '2')
INSERT INTO spaces VALUES('Flat', '1 bedroom with balcony and sea view', '300', '3')
INSERT INTO spaces VALUES('Bungalow', '2 bedrooms with jacuzzi', '90', '4')
INSERT INTO spaces VALUES('Mansion', '10 rooms with butler', '999', '5')