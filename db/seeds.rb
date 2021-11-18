require "open-uri"

user_photos = [
  'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZmFjZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZmFjZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1604426633861-11b2faead63c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8ZmFjZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZmFjZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fGZhY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1567186937675-a5131c8a89ea?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzF8fGZhY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1597223557154-721c1cecc4b0?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzh8fGZhY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1514846326710-096e4a8035e0?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fGZhY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzd8fGZhY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1546820389-44d77e1f3b31?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzl8fGZhY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1542131596-dea5384842c7?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDV8fGZhY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDh8fGZhY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTN8fGZhY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1558507652-2d9626c4e67a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzJ8fGZhY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1611310424006-42cf1e064288?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OTF8fGZhY2V8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'
]

puts "Creating George"
george = User.create(name: "George Kettle", email: "george@gmail.com", password: 'secret', username: 'george')
file = URI.open("https://instagram.fsyd3-1.fna.fbcdn.net/v/t51.2885-19/s320x320/52134512_400157867412638_7759771014875054080_n.jpg?_nc_ht=instagram.fsyd3-1.fna.fbcdn.net&_nc_cat=102&_nc_ohc=feoV2_A8iasAX9Uoxgn&tn=OXBr27oarIh1JnAb&edm=ABfd0MgBAAAA&ccb=7-4&oh=31982ff439cb41b02847586c3725ffcd&oe=6194037F&_nc_sid=7bff83")
george.photo.attach(io: file, filename: "#{george.name}.jpeg", content_type: 'image/jpeg')
george.save
puts "Finished creating George"

puts "Creating users"
user_photos.each do |user_photo|
  full_name = Faker::Name.name
  user_name = full_name.downcase.split.join('_')
  puts "- Creating #{full_name}"
  user = User.new(name: full_name, email: "#{user_name}@gmail.com", password: 'secret', username: user_name)
  file = URI.open(user_photo)
  user.photo.attach(io: file, filename: "#{user.name}.jpeg", content_type: 'image/jpeg')
  user.save
end
puts "Finished creating users"

boards = [
	{ name: 'Sydney', coordinates: [ -33.847927, 150.651791 ] },
	{ name: 'Sydney Opera House, Sydney', coordinates: [ -33.847927, 150.651791 ] },
	{ name: 'Luna Park, Sydney', coordinates: [ -33.847927, 150.651791 ] },
	{ name: 'Melbourne', coordinates: [ -37.9712371,144.4927112 ] },
	{ name: 'Perth', coordinates: [ -32.0397559,115.6813512 ] },
	{ name: 'Esperance, WA, Australia', coordinates: [ -33.851725,121.8633359 ] },
	{ name: 'Yallingup, WA', coordinates: [ -33.679676,114.9965558 ] },
	{ name: 'Meelup, WA', coordinates: [ -33.573477,115.0854349 ] },
	{ name: 'Dunsborough, WA', coordinates: [ -33.6102707,115.0753988 ] },
	{ name: 'Albany, WA', coordinates: [ -34.9920969,117.851939 ] },
	{ name: 'Margaret River, WA', coordinates: [ -33.9666535,115.017882 ] }
]

puts "Creating boards"
boards.each_with_index do |board_hash, index|
	puts "- Creating location: #{board_hash[:name]}"
	user = (index > 3) ? george : User.where(id: 2..4).sample
	coordinates = board_hash[:coordinates]
	location = Location.create!(address: board_hash[:name])
	puts "- Creating board for #{board_hash[:name]}"
	board = Board.create!(name: board_hash[:name], owner: user)
	puts "- Grabbing photos from unsplash"
	photos = Unsplash::Photo.search(board_hash[:name])
	puts "- Creating pins for #{board_hash[:name]}"
	photos.each do |photo|
		puts "-- Creating pin with description: #{photo.description}"
		pin = Pin.new(location: location)
		file = URI.open(photo.urls.regular)
		pin.photos.attach(io: file, filename: "#{photo.description}.jpeg", content_type: 'image/jpeg')
		pin.save!
		pin_save = Save.create!(board: board, pin: pin)
	end
end
puts "Finished creating boards"