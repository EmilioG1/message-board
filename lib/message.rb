class Message
  attr_reader :id
  attr_accessor :name, :board_id

  @@messages = {}
  @@total_rows = 0

  def initialize(name, board_id, id)
    @name = name
    @board_id = board_id
    @id = id || @@total_rows += 1
  end

  def ==(message_to_compare)
    (self.name() == message_to_compare.name()) && (self.board_id() == message_to_compare.board_id())
  end

  def self.all
    @@messages.values
  end

  def save
    @@messages[self.id] = Message.new(self.name, self.board_id, self.id)
  end

  def self.find(id)
    @@messages[id]
  end

  def update(name, board_id)
    self.name = name
    self.board_id = board_id
    @@messages[self.id] = Message.new(self.name, self.boardm_id, self.id)
  end

  def delete
    @@messages.delete(self.id)
  end

  def self.clear
    @@messages = {}
  end
end