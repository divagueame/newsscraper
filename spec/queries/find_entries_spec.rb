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
  end
end
