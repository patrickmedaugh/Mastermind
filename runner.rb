require './mastermind'

puts "Welcome to Mastermind"
mastermind = Mastermind.new
response = nil
#user makes first menu selection
puts mastermind.print_menu
menu_select = gets.chomp

while menu_select != "q"

  #user selects difficulty
  if menu_select == "p"
    difficulty_selected = nil
    until difficulty_selected == "B" || difficulty_selected == "I" || difficulty_selected == "H"
    puts mastermind.print_difficulty
    print "> "
    input = gets.chomp
    difficulty_selected = input.upcase
    end
    mastermind.difficulty(input)

    #generates secret answer & starts the game
    puts mastermind.print_play
    t1 = mastermind.time
    mastermind.color_gen
    response = nil
    #runs the game until user wins or quits
    until (response && response.status == :won) || (response && response.status == :quit)
      print "> "
      input = gets.chomp

      mastermind.guess_gen(input)
      mastermind.compare_positions
      mastermind.compare_colors
      mastermind.guess_count
      response = mastermind.compare
      puts response.message
    end

    #user wins or quits
   if response.status == :won
     t2 = mastermind.time
     puts "Time: #{(t2 - t1).to_i} seconds"
     print mastermind.play_again
     menu_select = gets.chomp

   elsif response.status == :quit
     break
   end

   #other menu options
  elsif menu_select == "i"
    puts mastermind.print_instruct
    menu_select = gets.chomp

  else
    puts mastermind.print_exception
    menu_select = gets.chomp
  end
end

if menu_select != "p"
puts mastermind.print_quit
end
puts "Goodbye!"
