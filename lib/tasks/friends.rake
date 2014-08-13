require 'faker'
MAX_USERS = 9000

def n_unique_rand(max_friends=10, rand_upper_limit=MAX_USERS)
  number_to_generate = rand(1..max_friends)
  return (0..rand_upper_limit - 1).sort_by{rand}[0..number_to_generate - 1]
end

task :create_users => :environment do
  (1..MAX_USERS).each do |i|
    friends = n_unique_rand
    name = Faker::Name.name
    puts "#{i} .. #{friends.join(', ') } -- #{name}"
    user = User.create(name: name, friends: friends, age: rand(20..99))
  end
end
