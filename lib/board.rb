class Board
  attr_accessor :id, :name
  @@boards = {}
  @@id_count = 0


  def initialize(name, id)
    @name = name
    @id = id || @@id_count += 1
  end

  def ==(board_to_compare)
    self.name() == board_to_compare.name()
  end

  def self.all
    @@boards.values()
  end

  def save
    @@boards[self.id] = Board.new(self.name, self.id)
  end

  def self.clear
    @@boards = {}
    @@id_count = 0
  end

  def self.find(id)
    @@boards[id]
  end

  def update(name)
    @name = name
  end

  def delete
    @@boards.delete(self.id)
  end
end
