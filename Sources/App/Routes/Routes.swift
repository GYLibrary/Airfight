import Vapor
import Python
import Foundation
let version = "api/V1/"


extension Droplet {
    func setupRoutes() throws {
        
        
        get(version+"hello") { req in
//            print( req.query?.context)

            var json = JSON()
            
            guard let _ = req.data["zgy"]?.string else {
                try json.set("errorCode", "-666")
                try json.set("erroInfo", "json serial")
                try json.set("data",1)
                return json
            }
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
//            let path = Bundle.init(for: PostController.self).resourcePath! + "/11846829.jpeg"
//            print(path!)
//            guard let path = Bundle.main.resourcePath else {
//                preconditionFailure("No config file found")
//            }
//            let config = try Config(arguments: ["--workDir=\(path)"])
            
//            let drop = try Droplet(config: config)
//            let str = Bundle.path(forResource: "11846829", ofType: "jpeg", inDirectory: "Public")
        
            let writeableDir = #file.components(separatedBy: "/").dropLast().joined(separator: "/")
//            print(writeableDir)
            return try Response(filePath: writeableDir+"/11846829.jpeg")
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
            let writeableDir = #file.components(separatedBy: "/").dropLast().joined(separator: "/") + "/Rocomml2.BIN"
            
            let file = NSData(contentsOfFile: writeableDir)! as Data

            return file
        }
        
        
    }
}
