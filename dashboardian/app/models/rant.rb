class Rant
  attr_reader :description

  def initialize(args)
    @description = args.fetch('description')
  end
end
