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

  def difficult
    "Please select a difficulty: (B)eginner, (I)ntermediate, (H)ard."
  end

  def beginner
    "I have generated a beginner sequence with 4 elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
  end

  def intermediate
    "I have generated an intermediate sequence with 6 elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, and (w)hite. Use (q)uit at any time to end the game."
  end

  def hard
    "I have generated a hard sequence with 8 elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, (w)hite, and (p)urple. Use (q)uit at any time to end the game."
  end

  def quit
    "Exiting..."
  end
  
  def exception
    "I didn't catch that. Please select (p)lay, (i)nstructions, or (q)uit."
  end

end
