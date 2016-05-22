class Game
  attr_reader :tribes

  def initialize(*_tribes)
    @tribes = _tribes.flatten
  end

  def add_tribe(tribe)
    @tribes << tribe
  end

  def immunity_challenge
    @tribes.shuffle.sample
  end

  def clear_tribes
    @tribes = []
  end

  def merge(name)
    new_members = []
    @tribes.each do |tribe|
      new_members << tribe.members
    end
    Tribe.new({members: new_members.flatten!, name: name})
  end

  def individual_immunity_challenge
    select_tribe = @tribes.sample
    select_tribe.members.sample  
  end

end
