//
//  NextViewController.swift
//  Swift5Keyboard
//
//  Created by Takahiro Kirifu on 2020/02/27.
//  Copyright © 2020 Takahiro Kirifu. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel2: UILabel!
    
    @IBOutlet weak var passWordLabel2: UILabel!
    
    var userName = ""
    
    var passWord = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameLabel2.text = userName
        passWordLabel2.text = passWord

        
    }
    
    @IBAction func back(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
