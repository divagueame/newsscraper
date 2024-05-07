RSpec.describe Entry, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      entry = Entry.new(title: 'Example Title', position: 1, comments: 'Example Comments', points: 10)
      expect(entry).to be_valid
    end

    it 'is not valid without a title' do
      entry = Entry.new(position: 1, comments: 'Example Comments', points: 10)
      expect(entry).not_to be_valid
      expect(entry.errors[:title]).to include("can't be blank")
    end

    it 'is not valid without a position' do
      entry = Entry.new(title: 'Example Title', comments: 'Example Comments', points: 10)
      expect(entry).not_to be_valid
      expect(entry.errors[:position]).to include("can't be blank")
    end

    it 'is is valid without comments and set 0 as value' do
      entry = Entry.new(title: 'Example Title', position: 1, points: 10)
      expect(entry).to be_valid
      expect(entry.comments).to be(0)
    end

    it 'is is valid without points and set 0 as value' do
      entry = Entry.new(title: 'Example Title', position: 1, comments: 10)
      expect(entry).to be_valid
      expect(entry.points).to be(0)
    end
  end

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

  describe 'scopes' do
    let!(:entry1) { create(:entry, title: 'Two Two') }
    let!(:entry2) { create(:entry, title: 'Two Two') }
    let!(:entry3) { create(:entry, title: 'Three Three Three') }
    let!(:entry4) { create(:entry, title: 'Four Four Four Four') }

    describe '.with_title_word_count_greater_than' do
      it 'returns entries with a title word count greater than the specified count' do
        entries = Entry.with_title_word_count_greater_than(2)
        expect(entries).to match_array([entry3, entry4])
      end

      it 'returns no entries if there are no titles with a word count greater than the specified count' do
        entries = Entry.with_title_word_count_greater_than(4)
        expect(entries).to be_empty
      end
    end

    describe '.with_title_word_count_less_than' do
      it 'returns entries with a title word count less than the specified count' do
        entries = Entry.with_title_word_count_less_than(3)
        expect(entries).to match_array([entry1, entry2])
      end

      it 'returns no entries if there are no titles with a word count less than the specified count' do
        entries = Entry.with_title_word_count_less_than(2)
        expect(entries).to be_empty
      end
    end
  end
end
