module Love
  class Storage

    attr_accessor :gems, :authors, :root

    def initialize(gems, authors, root)
      @gems = gems
      @authors = authors
      @root = root
    end

  end
end
