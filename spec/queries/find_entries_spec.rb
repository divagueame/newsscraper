# spec/queries/find_entries_spec.rb
require 'rails_helper'

RSpec.describe FindEntries do
  describe '#call' do
    let!(:entry1) { create(:entry, title: 'First Entry', position: 1, comments: 2, points: 5) }
    let!(:entry2) { create(:entry, title: 'Second Entry Another Word', position: 2, comments: 1, points: 10) }
    let!(:entry3) { create(:entry, title: 'Third', position: 3, comments: 3, points: 15) }

    it 'returns all entries' do
      params = {}
      results = FindEntries.new.call(params)
      expect(results).to match_array([entry1, entry2, entry3])
    end

    it 'filters by min_words_count' do
      params = { min_words_count: 2 }
      results = FindEntries.new.call(params)
      expect(results).to contain_exactly(entry2)
    end

    it 'filters by max_words_count' do
      params = { max_words_count: 2 }
      results = FindEntries.new.call(params)
      expect(results).to contain_exactly(entry3)
    end

    it 'sorts by position in ascending order by default' do
      results = FindEntries.new.call
      expect(results).to eq([entry1, entry2, entry3])
    end

    it 'sorts by the specified order_by comments parameter' do
      params = { order_by: 'comments_desc' }
      results = FindEntries.new.call(params)
      expect(results).to eq([entry3, entry1, entry2])
    end

    it 'sorts by the specified order_by points parameter' do
      params = { order_by: 'points_desc' }
      results = FindEntries.new.call(params)
      expect(results).to eq([entry3, entry2, entry1])
    end
  end
end
