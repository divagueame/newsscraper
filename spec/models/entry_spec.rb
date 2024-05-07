  describe 'constants' do
    it 'defines ORDER_BY constant' do
      expect(Entry.const_defined?(:ORDER_BY)).to be_truthy
      expect(Entry::ORDER_BY).to eq({
                                      position_asc: 'position ASC',
                                      position_desc: 'position DESC',
                                      comments_desc: 'comments DESC',
                                      points_desc: 'points DESC'
                                    })
    end
  end
