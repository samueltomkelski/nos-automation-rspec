module Request
    include HTTParty

    base_uri            'https://gorest.co.in/public/v2'          #configuration of the common URL of requests
    format              :json                                     #json format configuration
    headers Accept:     "*/*",
                        "Content-Type": "application/json"         #default headers configuration

end