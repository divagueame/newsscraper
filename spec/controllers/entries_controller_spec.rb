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

end
