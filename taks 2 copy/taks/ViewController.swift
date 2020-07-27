//
//  ViewController.swift
//  taks
//
//  Created by MAC on 27/07/20.
//  Copyright © 2020 hpApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var genderLbl: UILabel!
    
    @IBOutlet weak var heightLbl: UILabel!
    
    @IBOutlet weak var ageLbl: UILabel!
    
    @IBOutlet weak var clientLbl: UILabel!
    
    @IBOutlet weak var statusLbl: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
            NetworkManager().postData { data in
               
                //Saving Data in User Defaults
                UserDefaults.saveUserDetails(response: data)
            
            //Reading Data From User Defaults
            let userDetails = UserDefaults.getUserDetails()
             print(userDetails)
            
            DispatchQueue.main.async {
                
                     self.nameLbl.text = userDetails.name
                     self.genderLbl.text = userDetails.gender
                     self.ageLbl.text = String(userDetails.age)
                     self.clientLbl.text = String(userDetails.is_client)
                     self.heightLbl.text = String(userDetails.height)
                     self.statusLbl.text = String(userDetails.status)
    
            }
            
        }
    }

}

