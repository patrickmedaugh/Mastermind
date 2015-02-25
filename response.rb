class Response
  attr_reader :message, :status

  def initialize(inputs)
    @message = inputs[:message]
    @status  = inputs[:status]
  end

  def menu
    "Would you like to (p)lay a game of Mastermind? Read the (i)nstructions or (q)uit?"
  end

  def play
    "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
  end

  def instructions
    "Here are some instructions on how to play: guess colors and stuff. that's it. kthxbai."
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
