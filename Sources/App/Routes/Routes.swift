import Vapor
import Foundation
let version = "api/V1/"


extension Droplet {
    func setupRoutes() throws {
        get(version+"hello") { req in
            var json = JSON()
            try json.set("hello", "world")
            return json
        }
        
        get(version+"currentVersionInfo") { req in
            var json = JSON()
            try json.set("state", "1")
            try json.set("result", ["version": "3.0.0",
                                   "updateDesc":"1.你最帅\n2.你最美",
                                   "updateType": "optional"])
            return json
        }
        get(version+"image") { req in
            let path = Bundle.main.path(forResource: "11846829", ofType: "jpeg")
            
            return try Response.init(filePath: path!)
        }
        
        get(version + "httml") { req in
          return  Response(redirect: "http://www.jianshu.com/u/d20fcc519630")
            
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
        
        
        post(version+"download") { req in
            let path = Bundle.main.path(forResource: "Rocomml2", ofType: "BIN")
            
            return try Response.init(filePath: path!)
        }
        
        
    }
}
