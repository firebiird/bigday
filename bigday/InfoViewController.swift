//
//
//  bigday
//
//  Created by Lee Williams on 18/04/2017.
//  Copyright © 2017 AppSquabble. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let backend = BigDayService.getService();
        
        let data = backend.login.jsonDict
        
        if let name = data["n"] as? String
        {
            titleLabel.text = name;
        }
        
        
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

