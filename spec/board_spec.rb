require 'rspec'
require 'pry'
require 'board'

describe '#Board' do
  before(:each) do
    Board.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no boards") do
      expect(Board.all).to(eq([]))
    end
  end

  describe('#==') do
    it('is the same album if it has the same attributes as another boards') do
      board = Board.new('Blue', nil)
      board2 = Board.new('Blue', nil)
      expect(board).to(eq(board2))
    end
  end

  describe('#save') do
    it("saves a board") do
      board = Board.new('Giant Steps', nil)
      board.save()
      board2 = Board.new('Blue', nil)
      board2.save()
      expect(Board.all).to(eq([board, board2]))
    end
  end

  describe('.clear') do
    it('clears all boards') do
      board = Board.new("Giant Steps", nil)
      board.save()
      board2 = Board.new("Blue", nil)
      board2.save()
      Board.clear()
      expect(Board.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an board by id") do
      board = Board.new("Giant Steps", nil)
      board.save()
      board2 = Board.new("Blue", nil)
      board2.save()
      expect(Board.find(board.id)).to(eq(board))
    end
  end

  describe('#update') do
    it("updates a board by id") do
      board = Board.new("Giant Steps", nil)
      board.save()
      board.update("A Love Supreme")
      expect(board.name).to(eq("A Love Supreme"))
    end
  end

  describe('#delete') do
    it("deletes a board by id") do
      board = Board.new("Giant Steps", nil)
      board.save()
      board2 = Board.new("Blue", nil)
      board2.save()
      board2.delete()
      expect(Board.all).to(eq([board]))
    end
  end

  # describe('.search') do
  #   it("will locate an album based off of its name") do
  #     album = Album.new("Giant Steps", nil)
  #     album.save()
  #     album2 = Album.new("Blue", nil)
  #     album2.save()
  #     # binding.pry
  #     expect(Album.search(album2.name).values).to(eq([album2]))
  #   end
  # end
end