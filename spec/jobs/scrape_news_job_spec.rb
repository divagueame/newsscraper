RSpec.describe ScrapeNewsJob, type: :job do
  describe '#perform' do
    context 'scrapes news from Hacker News' do
      it 'creates first entries' do
        mock_html_response = File.read(Rails.root.join('spec', 'fixtures', 'hacker_news.html'))
        allow(URI).to receive(:open).and_return(double(read: mock_html_response))

        expect(URI).to receive(:open).with('https://news.ycombinator.com/').and_return(double(read: mock_html_response))
        expect { ScrapeNewsJob.perform_now }.to change(Entry, :count).by(30)

        entries = Entry.all
        expect(entries.first.title).to eq('Caniemail.com – like caniuse but for email content')
        expect(entries.first.position).to eq(1)
        expect(entries.first.comments).to eq(148)
        expect(entries.first.points).to eq(439)
      end
    end
  end
end
