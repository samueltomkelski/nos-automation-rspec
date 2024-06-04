require 'httparty'

class User
    include HTTParty
    base_uri 'https://gorest.co.in/public/v2'  #configuration of the common URL of requests
    @token = "3d2aada403b510c0ef41938b67c2896fe2e405f6e7c0d886a29fda103e638405"

    #Route for requests to be invoked easily
    def postUser(payload)
        return self.class.post(
            '/users',
            body: payload.to_json,
            headers: {
                Accept: "*/*",
                "Content-Type": "application/json",
                Authorization: "Bearer 3d2aada403b510c0ef41938b67c2896fe2e405f6e7c0d886a29fda103e638405",
            },
        )
    end

    def getAllUsers
        return self.class.get(
            '/users',
            headers: {
                "Content-Type": "application/json",
            },
        )
    end
end