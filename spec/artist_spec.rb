require 'pry'
require 'rspec'
require 'stage'
require 'artist'

describe '#Artist' do

  before(:each) do
    Stage.clear()
    Artist.clear()
    @stage = Stage.new(nil, "stage2", "Brett", "13:30")
    @stage.save
  end

  describe('#==') do
    it("test if artist, stage and time are =") do
      artist = Artist.new("Naima", @stage.id, nil, 1330)
      artist2 = Artist.new("Naima", @stage.id, nil, 1330)
      expect(artist).to(eq(artist2))
    end
  end

  describe('.all') do
    it("returns a list of all artists") do
      artist = Artist.new("Naima", @stage.id, nil, 1330)
      artist.save()
      artist2 = Artist.new("Naima2", @stage.id, nil, 1600)
      artist2.save()
      expect(Artist.all).to(eq([artist, artist2]))
    end
  end

  describe ('.clear') do
    it('clears all artists') do
      artist = Artist.new("Naima", @stage.id, nil, 1330)
      artist.save()
      artist2 = Artist.new("Naima2", @stage.id, nil, 1600)
      artist2.save()
      Artist.clear()
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a artist") do
      artist = Artist.new("Naima2", @stage.id, nil, 1600)
      artist.save()
      expect(Artist.all).to(eq([artist]))
    end
  end

  describe('#update') do
    it("updates an artist by id") do
      artist = Artist.new("Naima", @stage.id, nil, 1600)
      artist.save()
      artist.update("Test", @stage.id, 1200)
      expect(artist.artist_name).to(eq("Test"))
      expect(artist.time_slot).to(eq(1200))
    end
  end

  describe('#delete') do
    it("deletes an artist by id") do
      artist = Artist.new("Naima", @stage.id, nil, 1600)
      artist.save()
      artist2 = Artist.new("Test", @stage.id, nil, 1600)
      artist2.save()
      artist.delete()
      expect(Artist.all).to(eq([artist2]))
    end
  end

  describe('.find_by_stage') do
    it("finds artists for an stage") do
      stage = Stage.new(nil, 'Forest Stage', 'a', 'b')
      stage.save
      id = 5
      artist = Artist.new("Test1", @stage.id, nil, 1600)
      artist.save()
      artist2 = Artist.new("Test2", stage.id, nil, 1600)
      artist2.save()
      artist3 = Artist.new("Test3", stage.id, nil, 1600)
      artist3.save()
      expect(Artist.find_by_stage(stage.id)).to(eq([artist2, artist3]))
    end
  end
  describe('#stage') do
    it('finds a stage the artist will perform on') do
      artist = Artist.new("Test1", @stage.id, nil, 1600)
      artist.save()
      expect(artist.stage()).to(eq(@stage))
    end
  end
end
