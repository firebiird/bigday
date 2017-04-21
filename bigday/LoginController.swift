//
//  LoginController.swift
//  bigday
//
//  Created by Lee Williams on 18/04/2017.
//  Copyright © 2017 AppSquabble. All rights reserved.
//

import Foundation
import UIKit

class LoginController : UIViewController
{
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad();
        
        
        password.text = "Slee";
    }
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func OnClickOpen(_ sender: Any) {
    
        let backend = BigDayService.getService();
        
        backend.authHeader = password.text;
        
        backend.login.load().onSuccess { (data) in
            
            let db = UserDefaults.standard;
            db.set(self.password.text, forKey: "Pass");
            db.synchronize();
            
            self.performSegue(withIdentifier: "toMainApp", sender: nil);
            
        }.onFailure { (data) in
            let alert = UIAlertController.init(title: "Invalid Password", message: "The password you provided is not valid", preferredStyle: .alert);
            
            let defaultAction = UIAlertAction.init(title: "OK", style: .default, handler: { (action) in
                
            })
            alert.addAction(defaultAction);
            
            self.present(alert, animated: true, completion: nil);
            
        };
        
        
        
      
        
    
    
    }
    
    
}
