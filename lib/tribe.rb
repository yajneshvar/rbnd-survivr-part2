require 'colorizr'
class Tribe
  attr_reader :name, :members

  def initialize(details={})
    if (details)
      @name = details[:name]
      @members = details[:members]
      puts "Create tribe " + "#{name}".blue
    end
  end

  def tribal_council(opt={})
      @members.shuffle!
      removed_contestant = @members.reject {|member| member == opt[:immune]}.sample
      puts "#{removed_contestant} voted off"
      @members.delete(removed_contestant)
  end

  def to_s
    @name
  end



end
