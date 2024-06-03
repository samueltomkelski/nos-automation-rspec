describe 'GET /users' do
    it 'get all users' do
        @response = Request.get('/users')
        
        expect(@response.code).to eql 200
        expect(@response.size).to be > 0
    end
end