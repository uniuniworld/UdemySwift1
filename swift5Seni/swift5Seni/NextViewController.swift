//
//  NextViewController.swift
//  swift5Seni
//
//  Created by Takahiro Kirifu on 2020/02/27.
//  Copyright © 2020 Takahiro Kirifu. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var label2: UILabel!
    
    var count2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label2.text = String(count2)
        
    }
    
    @IBAction func back(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
}
