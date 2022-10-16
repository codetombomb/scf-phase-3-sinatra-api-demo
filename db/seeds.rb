puts "Seeding monsters 👾 and things 🗡🏹 🔥🔥🔥..."

response = HTTParty.get("https://botw-compendium.herokuapp.com/api/v2/all")
json = JSON.parse(response.body)["data"]

card_data = [
json["creatures"]["food"],
json["creatures"]["non_food"],
json["equipment"],
json["materials"],
json["monsters"],
json["treasure"]
]

card_data.each do |set|
   set.each do |item|
    item_card = ItemCard.create(
        image_url: item["image"],
        compendium_id: item["id"],
        name: item["name"],
        description: item["description"]
    )

    if  item["common_locations"]
        item["common_locations"].each do |location|
            l = Location.find_or_create_by(name: location)
            item_card.locations << l
        end
    else
        puts "#{item["name"]} - does not have a location set."
    end
   end
end

5.times do 
    User.create(Faker::Internet.user('username', 'email', 'password'))
end

settings = [
    {:diff => "easy", :cards => 12}, 
    {:diff => "med", :cards => 20}, 
    {:diff => "hard", :cards => 30}
]

User.all.each do |user|
    2.times do 
        config = settings.sample
        num_cards = config[:cards] / 2
        wrong_moves = rand(0...10)
        total_moves = num_cards + wrong_moves
        total_time = 1.5 * total_moves

        game = Game.create(
            user_id: user.id, 
            moves: total_moves, 
            wrong_moves: wrong_moves,
            difficulty: config[:diff], 
            total_time_seconds: total_time,
            complete: true
        )


        until game.item_cards.length == num_cards do
            random_card = ItemCard.all.sample
            if !game.item_cards.include? random_card
                game.item_cards << random_card
            end
        end
    end
end


puts "✅ Done seeding!"