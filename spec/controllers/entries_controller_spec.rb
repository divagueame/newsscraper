RSpec.describe EntriesController, type: :controller do
  describe 'GET index' do
    it 'returns a 200 status code' do
      get :index
      expect(response).to have_http_status(200)
    end
end
