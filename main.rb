require 'yaml'

# Load config
config = YAML.load_file('config.yml')
username = config['user']['name']

tasks = []

def list_tasks(tasks)
  tasks.each_with_index do |task, i|
    status = task[:done] ? "[x]" : "[ ]"
    puts "#{i+1}. #{status} #{task[:title]}"
  end
end

puts "Welcome #{username}! Simple Ruby Todo CLI"
loop do
  puts "\nOptions: (1) Add Task (2) List Tasks (3) Mark Done (4) Exit"
  choice = gets.chomp.to_i

  case choice
  when 1
    print "Enter task: "
    title = gets.chomp
    tasks << { title: title, done: false }
  when 2
    list_tasks(tasks)
  when 3
    list_tasks(tasks)
    print "Enter task number to mark done: "
    num = gets.chomp.to_i
    tasks[num-1][:done] = true if num > 0 && num <= tasks.size
  when 4
    puts "Goodbye!"
    break
  else
    puts "Invalid choice!"
  end
end
