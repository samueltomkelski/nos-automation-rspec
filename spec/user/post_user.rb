require_relative '../routes/user_route.rb'

RSpec.describe "POST /users" do
    @testSuite = load_yaml_with_methods(Dir.pwd + '/spec/data/post_user_data.yml')

    @testSuite.each do |testCase|
        context "#{testCase[:title]}" do
            before(:all) do
                @response = User.new.postUser(testCase['payload'])
            end

            it 'should return the status ' + "#{testCase['code']}" + ' code' do
                expect(@response.code).to eql testCase['code'] 
            end

            it 'should return the message: ' + "#{testCase['message']}" + ' code' do
                expect(@response.message.force_encoding('UTF-8')).to eql testCase['message'] 
            end

            if(testCase['code']  == 201)
                it 'Delete the created user to avoid cluttering the database' do
                    @delete_response = User.new.deleteUser(@response['id'])

                    expect(@delete_response.code).to eql 204

                    @get_response = User.new.getUserById(@response['id'])

                    expect(@get_response.code).to eql 200
                    expect(@get_response.body).to eql '[]'
                end
            end
        end
    end
end