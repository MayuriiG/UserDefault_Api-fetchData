//
//  UserDefaults+Ext.swift
//  taks
//
//  Created by MAC on 27/07/20.
//  Copyright © 2020 hpApps. All rights reserved.
//

import Foundation
extension UserDefaults {
    
    //save
    
   static func saveUserDetails(response:Response) {
        let data = try! JSONEncoder().encode(response)
        let UD = UserDefaults.standard
        UD.setValue(data, forKey: Keys.userDetails)
        
    }
    
    
    
    //get.................
    static func getUserDetails() -> Response {
        let UD = UserDefaults.standard
        let value = UD.value(forKey: Keys.userDetails) as? Data
        let response = try! JSONDecoder().decode(Response.self, from: value ?? Data())
        return response
    }
}
