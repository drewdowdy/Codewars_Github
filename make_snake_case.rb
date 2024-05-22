puts "What text would you like to convert?"
answer = gets.chomp
puts 'snake_case: ' + answer.gsub(' ','_')