
//
//  File.swift
//  taks
//
//  Created by MAC on 27/07/20.
//  Copyright © 2020 hpApps. All rights reserved.
//


//balancenutrition.in/bn-api-new/cleanse_client_app/demo_api/get_demo_data


import Foundation

class NetworkManager {
   
    
    func postData(completion: @escaping (_ data:Response) -> ()) {
       
        let stringUrl = "https://www.balancenutrition.in/bn-api-new/cleanse_client_app/demo_api/get_demo_data"
       
        let params:[String:Any] = [
                       "source":"ios",
                      "os":"ios",
                      "model":"model",
                      "appversion":1.2,
                      "screen_name":"demo",
                      "token":"token",
                      "format":"json"
                     ]
        
       
        var data = Data()
       
        do {
            data = try JSONSerialization.data(withJSONObject: params, options: [])
       
        }catch{print("Error : ", error.localizedDescription)}
       
        guard let url = URL(string: stringUrl) else {return}
       
        var request = URLRequest(url: url)
       
        request.httpBody = data
        request.httpMethod = "post"
        URLSession.shared.dataTask(with: request) { (data, resp, err) in
            
            do {
             
                let decodedJson = try JSONDecoder().decode(Response.self, from: data!)
                debugPrint(decodedJson)
                completion(decodedJson)
              }
            catch{
                debugPrint("error")
            }
      
        }.resume()
        
    }
}


struct Response:Codable {
    var height:Int 
    var gender:String
    var name:String
    var is_client:Bool
    var age:Int
    var status:Bool
}


struct Keys {
    static let userDetails = "userDetails"
    static let height = "height"
    static let gender = "gender"
    static let name = "name"
    static let is_client = "is_client"
    static let age = "age"
    static let status = "status"
}
