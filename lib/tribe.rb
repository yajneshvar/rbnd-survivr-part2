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
      delete_index = @members.rindex {|member| member != opt[:immune]}
      @members.delete_at(delete_index)
  end

  def to_s
    @name
  end



end
