require 'colorizr'
class Jury

  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member(name)
    @members << name if name
  end

  def cast_votes (finalists)
    votes = Hash.new
      finalists.each do |contestant|
        votes[contestant] = 0
      end
      @members.each do |member|
        selected = finalists.shuffle.sample
        votes[selected] += 1
        puts "#{member} voted for #{selected}"
      end
    return votes
  end

  def report_votes(votes)
    votes.each_pair do |finalist,total_votes|
      puts "#{finalist} got " + "#{total_votes}".red + " votes"
    end
  end

  def announce_winner(votes)
      most_vote = 0
      winner = nil

      votes.each_pair do |finalist,total_votes|
        if (total_votes > most_vote)
          winner = finalist
          most_vote = total_votes
        elsif(total_votes == most_vote)
          return winner
        end
      end
      puts "The winner is #{winner}".yellow
      return winner
  end

end
