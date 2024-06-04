require 'httparty'

class User
    include HTTParty
    base_uri 'https://gorest.co.in/public/v2'  #configuration of the common URL of requests
    @@token = "b6940d842fbe608796537b5029ea23d08cd9669bac848410044be6eee0bb36bd" #define token

    #Route for requests to be invoked easily
    def postUser(payload)
        return self.class.post(
            "/users",
            body: payload.to_json,
            headers: {
                Accept: "*/*",
                "Content-Type": "application/json",
                Authorization: "Bearer #{@@token}",
            },
        )
    end

    def getAllUsers
        return self.class.get(
            "/users",
            headers: {
                "Content-Type": "application/json",
            },
        )
    end

    def getUserById(user_id)
        return self.class.get(
            "/users/?id=#{user_id}",
            headers: {
                Accept: "*/*",
                "Content-Type": "application/json",
                Authorization: "Bearer #{@@token}",
            },
        )
    end

    def deleteUser(user_id)
        return self.class.delete(
            "/users/#{user_id}",
            headers: {
                Accept: "*/*",
                "Content-Type": "application/json",
                Authorization: "Bearer #{@@token}",
            },
        )
    end
end