require './lib/card'
require './lib/deck'
require './lib/round'

@card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
@card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
@card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
@card_4 = Card.new("What is the capital of Wisconsin?", "Madison", :Geography)

@cards = [@card_1, @card_2, @card_3, @card_4]

@deck = Deck.new(@cards)
@round = Round.new(@deck)

def start
 @count = 0

    puts "Welcome! You're playing with #{@deck.cards.size} cards."
    puts "______________________________________"

    while @count < @deck.cards.size
      puts "This is card number #{@round.turns.size + 1} out of #{@deck.cards.size}."
      puts "Question #{@deck.cards.first.question}?"

      print "Guess:"
      guesses = gets.chomp.to_s
      @round.take_turn(guesses)
      puts
      puts "Your answer is: #{@round.new_turn.correct?}"
      puts
      @count += 1
  end

   puts "****** Game Over! ******"
   puts "You had #{@round.number_correct} correct guesses out of #{@deck.cards.size} for a total score of #{@round.percent_correct}%."
   puts "STEM - #{@round.percent_correct_by_category(:STEM)}% correct."
   puts "Geography - #{@round.percent_correct_by_category(:Geography)}% correct."
end

start

#while deck is full complete this code
