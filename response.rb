class Response
  attr_reader :message, :status

  def initialize(inputs)
    @message = inputs[:message]
    @status  = inputs[:status]
  end

  def menu
    "Would you like to (p)lay a game of Mastermind? Read the (i)nstructions or (q)uit?"
  end

  def instructions
    "Here are some instructions on how to play Mastermind: Take turns guessing colors in a randomly generated sequence. The game will tell you how many correct colors you guessed and how many correct colors at the correct positions you guessed. Try to guess the sequence of colors in as few guesses as possible. Please select (p)lay, (i)nstructions, or (q)uit."
  end

  def win
    "You Win!"
  end

  def quit
    "Exiting..."
  end

  def exception
    "I didn't catch that. Please select (p)lay, (i)nstructions, or (q)uit."
  end

end
