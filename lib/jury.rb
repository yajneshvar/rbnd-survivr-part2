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
        selected = finalists.sample
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
      winner = votes.max_by{|contestant,vote| vote}.shift
      puts "The winner is #{winner}".yellow
      return winner
  end

end
