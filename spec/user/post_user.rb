require_relative '../routes/user_route.rb'
require_relative '../commons/data_commons.rb'
require 'spec_helper'

describe 'POST /users' do
    @testSuite = load_yaml_with_methods(Dir.pwd + '/spec/data/user_data.yml')

    @testSuite.each do |testCase|
        context "#{testCase[:title]}" do
            before(:all) do
                @response = User.new.postUser(testCase['payload'])
                puts @response.body
            end

            it 'should return the status ' + "#{testCase['code']}" + ' code' do
                expect(@response.code).to eql testCase['code'] 
            end

            it 'should return the message: ' + "#{testCase['message']}" + ' code' do
                expect(@response.message.force_encoding('UTF-8')).to eql testCase['message'] 
            end
        end
    end
end