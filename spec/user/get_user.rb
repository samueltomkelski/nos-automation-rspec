require_relative '../routes/user_route.rb'

describe 'GET /users' do
    it 'get all users' do
        @response = User.new.getAllUsers()
        
        expect(@response.code).to eql 200
        expect(@response.size).to be > 0
    end
end