class Book
  attr_reader :title

  def initialize(args)
    @title = args.fetch('title')
  end
end
