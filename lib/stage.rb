class Stage
  attr_reader :id
  attr_accessor :stage_name, :artist, :date, :time_slot

  @@stages = {}
  @@total_rows = 0

  def initialize (id, stage_name, artist, date, time_slot)
    @id = id || @@total_rows += 1
    @stage_name = stage_name
    @artist = artist
    @date = date
    @time_slot = time_slot
  end

  def self.all
    @@stages.values()
  end

  def save
    @@stages[self.id] = Stage.new(self.id, self.stage_name, self.artist, self.date, self.time_slot)
  end

  def ==(stage_to_compare)
    self.time_slot() == stage_to_compare.time_slot()
  end

  def self.clear
    @@stages = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@stages[id]
  end

  def self.search(search_term)
     @@stages.values.select { |stage| stage.stage_name =~ /#{search_term}/i }
  end

  def self.sort
    @@stages.values.sort { |a, b| a.stage_name <=> b.stage_name }
  end

  def update(stage_name, artist, date, time_slot)
    @stage_name = (stage_name != '') ? stage_name : @stage_name
    @artist = (artist != '') ? artist : @artist
    @date = (date != '') ? date : @date
    @time_slot = (time_slot != '') ? time_slot : @time_slot
  end

  def delete
    @@stages.delete(self.id)
  end

  def artists
    Artist.find_by_stage(self.id)
  end
end
