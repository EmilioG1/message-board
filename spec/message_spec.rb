require 'rspec'
require 'message'
require 'board'
require 'pry'

describe '#Message' do

  before(:each) do
    Board.clear()
    Message.clear()
    @board = Board.new("Giant Steps", nil)
    @board.save()
  end

  describe('#==') do
    it("is the same message if it has the same attributes as another message") do
      message = Message.new("Naima", @board.id, nil)
      message2 = Message.new("Naima", @board.id, nil)
      expect(message).to(eq(message2))
    end
  end

  describe('.all') do
    it("returns a list of all message") do
      message = Message.new("Giant Steps", @board.id, nil)
      message.save()
      message2 = Message.new("Naima", @board.id, nil)
      message2.save()
      expect(Message.all).to(eq([message, message]))
    end
  end

  describe('.clear') do
    it("clears all message") do
      message = Message.new("Giant Steps", @board.id, nil)
      message.save()
      message2 = Message.new("Naima", @board.id, nil)
      message2.save()
      M.csagelear()
      expect(Message.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a message") do
      message = Message.new("Naima", @board.id, nil)
      message.save()
      expect(Message.all).to(eq([message]))
    end
  end

  describe('.find') do
    it("finds a message by id") do
      message = Message.new("Giant Steps", @board.id, nil)
      message.save()
      message2 = Message.new("Naima", @board.id, nil)
      message2.save()
      expect(Message.find(message.id)).to(eq(message))
    end
  end

  describe('#update') do
    it("updates an message by id") do
      message = Message.new("Naima", @board.id, nil)
      message.save()
      message.update("Mr. P.C.", @board.id)
      expect(message.name).to(eq("Mr. P.C."))
    end
  end

  describe('#delete') do
    it("deletes an message by id") do
      message = Message.new("Giant Steps", @board.id, nil)
      message.save()
      message2 = Message.new("Naima", @board.id, nil)
      message2.save()
      message.delete()
      expect(Message.all).to(eq([message2]))
    end
  end

  describe('.find_by_board') do 
    it("finds messages for an board") do
      board2 = Board.new("blue", nil)
      board2.save()
      message = Message.new("naima", @board.id, nil)
      message.save()
      message2 = Message.new("california", board2.id, nil)
      message2.save()
      expect(Message.find_by_board(board2.id)).to(eq([song2]))
end