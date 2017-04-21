//
//  BackendService.swift
//  bigday
//
//  Created by Lee Williams on 20/04/2017.
//  Copyright © 2017 AppSquabble. All rights reserved.
//

import Foundation
import Siesta

class BigDayService : Service
{
    
    init() {
        
        super.init(baseURL: "http://172.16.0.188:9012/v1");
        configure { $0.headers["password"] = self.authHeader }
    }
    
    var login:   Resource { return resource("/wedding/login") }
    
    var authHeader: String? {
        didSet {
            // Clear any cached data now that auth has changed
            wipeResources()
            
            // Force resources to recompute headers next time they’re fetched
            invalidateConfiguration()
        }
    }
    
    
    
    static var instance = BigDayService();
    static func getService() -> BigDayService {
        
        
        return instance;
        
    }
    
}
