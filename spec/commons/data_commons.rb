module DataCommons
    def generate_name
        Faker::Name.name 
    end

    def generate_email
        Faker::Internet.email(name: generate_name, separators: ['+'])
    end

    def generate_gender
        Faker::Gender.binary_type
    end
end