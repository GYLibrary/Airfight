import Vapor

let version = "api/V1/"


extension Droplet {
    func setupRoutes() throws {
        get(version+"hello") { req in
            var json = JSON()
            try json.set("hello", "world")
            return json
        }

        get(version+"plaintext") { req in
            return "Hello, world!"
        }
        
           
        // response to requests to /info domain
        // with a description of the request
        get(version+"info") { req in
            return req.description
        }

        get(version+"description") { req in return req.description }
        
        try resource("posts", PostController.self)
    }

}

extension Droplet {
    func postsRoutes() throws {
        
        post(version+"gy"){ req in
            var json = JSON()
            try json.set("hello", "wrold")
            try json.set("GY", "Handsome")
            return json
        }
        
    }
}
