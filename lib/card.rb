class Card
    attr_reader :value, :suit
  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def card_value_reassigned
     card_value = {
       "2" => 20,
       "3" => 30,
       "4" => 40,
       "5" => 50,
       "6" => 60,
       "7" => 70,
       "8" => 80,
       "9" => 90,
       "10" => 100,
       "Jack" => 110,
       "Queen" => 120,
       "King" => 130,
       "Ace" => 140
       }
   end

   def card_suit_value
     card_suit = {
       "Clubs" => 1,
       "Diamonds" => 2,
       "Hearts" => 3,
       "Spades" => 4
       }
   end

   def total_card_value
     card_value_reassigned[value] + card_suit_value[suit]
   end

end
