class Game
  attr_reader :tribes

  def initialize(*_tribes)
    @tribes = _tribes.flatten
  end

  def add_tribe(tribe)
    @tribes << tribe
  end

  def immunity_challenge
    winning_tribe = @tribes.sample
  end

  def clear_tribes
    @tribes = []
  end

  def merge(name)
    new_members = []
    @tribes.each do |tribe|
      new_members << tribe.members
    end
    @tribes.clear
    merged_tribe = Tribe.new({members: new_members.flatten!, name: name})
    @tribes << merged_tribe
    return merged_tribe
  end

  def individual_immunity_challenge
    @tribes.sample.members.sample
  end

end
