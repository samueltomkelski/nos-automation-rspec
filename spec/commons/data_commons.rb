module DataCommons
    def generate_name
        Faker::Name.name
        return 
    end

    def generate_email(name)
        Faker::Internet.email(name: generate_name, separators: ['+'])
    end

    def generate_gender
        Faker::Gender.binary_type
    end
end