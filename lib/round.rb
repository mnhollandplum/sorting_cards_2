require 'pry'
class Round
  attr_reader :deck, :guesses, :number_correct
  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
  end

  def current_card
    deck.cards[0]
  end

  def record_guess(response)
    card_attributes = "#{response[:value]} of #{response[:suit]}"
     guess = Guess.new(card_attributes, current_card)
     @guesses << guess
     binding.pry
     if guess.feedback == "Correct!"
       @number_correct += 1
     end
     deck.cards.shift
     guess
  end

  def percent_correct
    @number_correct.to_f/@guesses.count * 100
  end
end
