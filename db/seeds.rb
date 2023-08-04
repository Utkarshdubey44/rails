# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

FRIENDS = [{name:  "Utkarsh Dubey", phone: 2345436567, gender: "M", description: "Human are the best example of God!", user_id: User.first.id},{name:  "Krishna", phone: 2345436567, gender: "M", description: "Supreme power is god!", user_id: User.first.id},{name:  "Ram Narayan", phone: 2345346567, gender: "M", description: "Bhakti means mann ki shakti!", user_id: User.first.id},{name:  "Shyam Narayan", phone: 9845436567, gender: "M", description: "Practice is the key to learning!", user_id: User.first.id},{name: "Madhav", phone: 7845436567, gender: "M", description: "Hare Krishna hare Ram!", user_id: User.first.id}]

FRIENDS.each do |friend|
    Friend.find_or_initialize_by(name: friend[:name], phone: friend[:phone], gender: friend[:gender], description: friend[:description], user_id: friend[:user_id]) do |status|
        status.save!
        puts 'Friend has been created!!'
    end
end
