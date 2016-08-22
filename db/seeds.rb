require 'sqlite3'

database = SQLite3::Database.new("db/robot_world_development.db")

database.execute("DELETE FROM robots;")

database.execute("INSERT INTO robots (name, department, city, state, manufacture_date, hire_date, avatar) VALUES ('George', 'Maintainance', 'Flint', 'MI', '1988-12-13', '1997-11-03', 'https://robohash.org/12345');")

puts database.execute("SELECT * FROM robots;")
