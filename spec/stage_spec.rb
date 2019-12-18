require 'rspec'
require 'stage'
require 'artist'

describe '#Stage' do
  before(:each) do
    Stage.clear()
  end

  describe('.all') do
    it('returns an empty array when there are no albums') do
      expect(Stage.all).to(eq([]))
    end
  end
  describe('#save') do
    it('tests save function') do
      show = Stage.new(nil, "stage1", "Jason", "13:00")
      show.save()
      show2 = Stage.new(nil, "stage2", "Jason", "13:00")
      show2.save()
      expect(Stage.all).to(eq([show, show2]))
    end
  end
  describe('#==') do
    it('test stage time comparison') do
      show = Stage.new(nil, "stage1", "Jason", "13:00")
      show.save()
      show2 = Stage.new(nil, "stage1", "Brett", "13:00")
      show2.save()
      expect(show).to(eq(show2))
    end
  end
  describe('.clear') do
    it('Able to clear all stages') do
      show = Stage.new(nil, "stage1", "Jason", "13:00")
      show.save()
      show2 = Stage.new(nil, "stage2", "Brett", "13:30")
      show2.save()
      Stage.clear()
      expect(Stage.all).to(eq([]))
    end
  end
  describe('.find') do
    it('able to find stage') do
      show = Stage.new(nil, "stage1", "Jason", "13:00")
      show.save()
      show2 = Stage.new(nil, "stage2", "Brett", "13:30")
      show2.save()
      expect(Stage.find(show.id)).to(eq(show))
    end
  end
  describe('#update') do
    it('able to update stage information') do
      show = Stage.new(nil, "stage1", "Jason", "13:00")
      show.save()
      show.update("stage2", "Brett", "13:30")
      expect(show.stage_name).to(eq("stage2"))
      expect(show.artist).to(eq("Brett"))
      expect(show.time_slot).to(eq("13:30"))
    end
  end
  describe('#delete') do
    it('deletes a show by id') do
      show = Stage.new(nil, "stage1", "Jason", "13:00")
      show.save()
      show2 = Stage.new(nil, "stage2", "Brett", "13:30")
      show2.save()
      show.delete()
      expect(Stage.all).to(eq([show2]))
    end
  end
  describe('#search') do
    it('searches for show by stage_name') do
      show = Stage.new(nil, "Forest Stage", "Jason", "13:00")
      show.save()
      show2 = Stage.new(nil, "Barn Stage", "Jason", "14:30")
      show2.save()
      show3 = Stage.new(nil, "Forest Stage", "Brett", "13:30")
      show3.save()
      search_term = 'forest'
      expect(Stage.search(search_term)).to(eq([show, show3]))
      # expect(show3.stage_name).to(eq("Barn Stage"))
    end
  end
  # describe('.sort') do
  #   it('')
  #   show = Stage.new(nil, "Forest Stage", "Jason", "13:00")
  #   show.save()
  #   show2 = Stage.new(nil, "Forest Stage", "Brett", "13:30")
  #   show2.save()
  #   show3 = Stage.new(nil, "Barn Stage", "Jason", "14:30")
  #   show3.save()
  #
  # end
end
