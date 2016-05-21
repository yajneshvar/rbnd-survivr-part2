class Tribe
  attr_reader :name, :members

  def initialize(details={})
    if (details)
      @name = details[:name]
      @members = details[:members]
      puts "Create tribe #{name}"
    end
  end

  def tribal_council(opt={})
      not_immune = @members.delete_if {|member| member == opt[:immune]}
      not_immune.shuffle.sample
  end

  def to_s
    @name
  end



end
