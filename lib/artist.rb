
require 'pry'
class Artist
  attr_reader :artist_id
  attr_accessor :artist_name, :stage_id, :time_slot

  @@artists = {}
  @@total_rows = 0

  def initialize(artist_name, stage_id, artist_id, time_slot)
    @artist_name = artist_name
    @stage_id = stage_id
    @artist_id = artist_id || @@total_rows += 1
    @time_slot = time_slot
  end

  def ==(artist_to_compare)
    (self.artist_name == artist_to_compare.artist_name) && (self.stage_id == artist_to_compare.stage_id) && (self.time_slot == artist_to_compare.time_slot)
  end
  def self.all
    @@artists.values
  end

  def save
    @@artists[self.artist_id] = Artist.new(self.artist_name, self.stage_id, self.artist_id ,self.time_slot)
  end

  def self.find(artist_id)
    @@artists[artist_id]
  end

  def update(artist_name, stage_id, time_slot)
    self.artist_name = artist_name
    self.stage_id = stage_id
    self.time_slot = time_slot
    @@artists[self.artist_id] = Artist.new(self.artist_name, self.stage_id, self.artist_id, self.time_slot)
  end

  def delete
    @@artists.delete(self.artist_id)
  end

  def self.clear
    @@artists  = {}
  end

  def self.find_by_stage(stg_id) #stg_id = stage_id
    artists = []
    @@artists.values.each do |artist|
      if artist.stage_id == stg_id
        artists.push(artist)
      end
    end
    artists
  end

  def stage
    Stage.find(self.stage_id)
  end
end
