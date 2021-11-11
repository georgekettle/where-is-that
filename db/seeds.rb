# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

george = User.create(name: "George Kettle", email: "george.kettle@icloud.com", password: 'secret', username: 'george')

boards = %w{Sydney Perth Esperance}
boards.each do |board|
	Board.create!(name: board, owner: george)
end