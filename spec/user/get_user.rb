require_relative '../routes/user_route.rb'

describe 'GET /users' do
    it 'get all users' do
        @response = User.new.getAllUsers()
        
        expect(@response.code).to eql 200
        expect(@response.size).to be > 0
    end

    it 'get user by id' do
        #Creating a user to ensure there is a user to search for
        payload = {
            name: "test.user.#{rand(1000)}",
            email: "test.user.#{rand(1000)}@example.com",
            gender: 'male',
            status: 'active'
          }
          @post_response = User.new.postUser(payload)

      
          user_id = @post_response['id']
      
          # Get the create user
          @get_response = User.new.getUserById(user_id)
          JSON.parse(@get_response.body)


          expect(@get_response.code).to eql 200
          expect(@get_response[0]['name']).to eql payload[:name]
          expect(@get_response[0]['email']).to eql payload[:email]
          expect(@get_response[0]['gender']).to eql payload[:gender]
          expect(@get_response[0]['status']).to eql payload[:status]
    end
end