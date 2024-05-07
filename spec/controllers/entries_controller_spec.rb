RSpec.describe EntriesController, type: :controller do
  describe 'GET index' do
    it 'returns a 200 status code' do
      get :index
      expect(response).to have_http_status(200)
    end

    context 'when sorting by comments' do
      it 'returns a 200 status code' do
        get :index, params: { order_by: :comments_desc }
        expect(response).to have_http_status(200)
      end
    end

    context 'when sorting by points' do
      it 'returns a 200 status code' do
        get :index, params: { order_by: :points_desc }
        expect(response).to have_http_status(200)
      end
    end

    context 'when filtering refreshing the scraped data' do
      it 'returns a 302 and redirects to root path' do
        get :index, params: { refresh: true }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when filtering by comments and min words count' do
      it 'returns a 200 status code' do
        get :index, params: { order_by: :comments_desc, min_words_count: 6 }
        expect(response).to have_http_status(200)
      end
    end

    context 'when filtering by points and max words count' do
      it 'returns a 200 status code ' do
        get :index, params: { order_by: :points_desc, max_words_count: 5 }
        expect(response).to have_http_status(200)
      end
    end
  end
end
