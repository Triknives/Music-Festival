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
end
