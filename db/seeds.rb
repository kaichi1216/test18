# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 10.times {
#   puts "start"
#   Task.create(task: "吃飯飯", deadline: "20191026-18:00", content: "晚上吃飯飯", priority: 'low')
#   puts "end"
# }
User.create(id:1, username: '監察院院長', email: 'rd@lig.com.tw', password: '123456', role: 'admin')

puts "建立人造人17號"
user1 = User.create(username: "人造人17號", email: "robot17@gmail.com", password: '123456', role: 'admin')
puts "以建立"
puts "Generating 10 Task..."
1000.times do |i|
  user1.tasks.create(task: ["吃飯", "睡覺", "打球", "健身", "游泳", "看電影"].sample,
                    deadline: Time.now,
                    state: ["pending", "processing", "solved"].sample,
                    priority: ['low', 'middle', 'high'].sample)
end
puts "Done!"

puts "建立人造人19號"
user1 = User.create(username: "人造人19號", email: "robot19@gmail.com", password: '123456', role: 'admin')
puts "以建立"
puts "Generating 10 Task..."
10.times do |i|
  user1.tasks.create(task: ["吃飯", "睡覺", "打球", "健身", "游泳", "看電影"].sample,
                    deadline: Time.now,
                    state: ["pending", "processing", "solved"].sample,
                    priority: ['low', 'middle', 'high'].sample)
end
puts "Done!"

puts "建立人造人18號"
user1 = User.create(username: "人造人18號", email: "robot18@gmail.com", password: '123456', role: 'admin')
puts "以建立"
puts "Generating 10 Task..."
10.times do |i|
  user1.tasks.create(task: ["吃飯", "睡覺", "打球", "健身", "游泳", "看電影"].sample,
                    deadline: Time.now,
                    state: ["pending", "processing", "solved"].sample,
                    priority: ['low', 'middle', 'high'].sample)
end
puts "Done!"
