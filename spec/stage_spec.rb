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
      stage = Stage.new(nil, "stage1", "Jason", "12/18/19", "13:00")
      stage.save()
      stage2 = Stage.new(nil, "stage2", "Jason", "12/18/19", "13:00")
      stage2.save()
      expect(Stage.all).to(eq([stage, stage2]))
    end
  end
end
