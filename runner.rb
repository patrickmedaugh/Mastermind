require './mastermind'

puts "Welcome to Mastermind"

mastermind = Mastermind.new
response = nil

puts mastermind.print_menu
menu_select = gets.chomp

#will loop menu options: instructions and exceptions
while menu_select != "q"

  #will print the play message, take start time and generate a secret answer
  if menu_select == "p"
    puts "Please select a difficulty: (B)eginner, (I)ntermediate, (H)ard."
    print "> "
    input = gets.chomp
    mastermind.difficulty(input)

    puts mastermind.print_play
    t1 = mastermind.time
    mastermind.color_gen

    #will contine to get input until it sees a quit command or a win (ASK ABOUT response && response.status)
    until (response && response.status == :won) || (response && response.status == :quit)
      print "> "
      input = gets.chomp

      mastermind.guess_gen(input)
      mastermind.compare_positions
      mastermind.compare_colors
      mastermind.guess_count
      response = mastermind.compare
      #ASK JOSH CHEEK WHY @guess IS NILCLASS ON THIS FILE
      puts response.message
    end#until

    #breaks out of menu loop when you win or quit, prints time on a win
   if response.status == :won
     t2 = mastermind.time
     puts "Time: #{(t2 - t1).to_i} seconds"
     break #while
   elsif response.status == :quit
     break #while
   end#if

  elsif menu_select == "i"
    puts mastermind.print_instruct
    menu_select = gets.chomp
  else
    puts mastermind.print_exception
    menu_select = gets.chomp
  end#if
end#while

if menu_select != "p"
puts mastermind.print_quit
end
puts "Goodbye!"
