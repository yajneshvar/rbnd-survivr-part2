require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"
require 'colorizr'

#After your tests pass, uncomment this code below
#=========================================================
# # Create an array of twenty hopefuls to compete on the island of Borneo
 @contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
 @contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!

# # Create two new tribes with names
 @coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
 @hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))
#
# # Create a new game of Survivor
 @borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
  eliminated = []
  8.times do
    #immunity_challenge
    losing_tribe = @borneo.immunity_challenge
    puts "Losing tribe is " + "#{losing_tribe}".pink
    #remove a tribe member
    eliminated << losing_tribe.tribal_council()
  end
  eliminated.length
end

def phase_two
  eliminated = []
  3.times do
    winner = @borneo.individual_immunity_challenge
    puts "Immunity challenge winner is " + "#{winner}".red
    eliminated << @borneo.tribes[0].tribal_council(immune:winner)
  end
  eliminated.length
end

def phase_three
  7.times do
    winner = @borneo.individual_immunity_challenge
    puts "Immunity challenge winner is " + "#{winner}".yellow
    @jury.add_member(@borneo.tribes[0].tribal_council(immune:winner))
  end
  @jury.members.length
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
 phase_one #8 eliminations
 @merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
 phase_two #3 more eliminations
 @jury = Jury.new
 phase_three #7 elminiations become jury members
 finalists = @merge_tribe.members #set finalists
 vote_results = @jury.cast_votes(finalists) #Jury members report votes
 @jury.report_votes(vote_results) #Jury announces their votes
 @jury.announce_winner(vote_results) #Jury announces final winner
