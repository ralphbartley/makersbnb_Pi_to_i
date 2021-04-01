\c makersbnb;

TRUNCATE users CASCADE;
SELECT setval('users_id_seq', 1);
SELECT setval('spaces_id_seq', 1);

INSERT INTO users (username, password) VALUES('Test', 'password');
INSERT INTO users (username, password) VALUES('Will', 'spencer');
INSERT INTO users (username, password) VALUES('Ralph', 'bartley');
INSERT INTO users (username, password) VALUES('Max', 'strivens');
INSERT INTO users (username, password) VALUES('David', 'greaves');

INSERT INTO spaces (name, description, daily_price, owner_id) VALUES('House', '4 bedrooms with swimming pool', '100', '4');
INSERT INTO spaces (name, description, daily_price, owner_id) VALUES('Cottage', '3 bedrooms with a thatched roof', '156', '3');
INSERT INTO spaces (name, description, daily_price, owner_id) VALUES('Flat', '1 bedroom with balcony and sea view', '300', '4');
INSERT INTO spaces (name, description, daily_price, owner_id) VALUES('Bungalow', '2 bedrooms with jacuzzi', '90', '5');
INSERT INTO spaces (name, description, daily_price, owner_id) VALUES('Mansion', '10 rooms with butler', '999', '6');

INSERT INTO dates_available (space_id, date) VALUES('2', '1');
INSERT INTO dates_available (space_id, date) VALUES('2', '2');
INSERT INTO dates_available (space_id, date) VALUES('2', '3');
INSERT INTO dates_available (space_id, date) VALUES('2', '4');
