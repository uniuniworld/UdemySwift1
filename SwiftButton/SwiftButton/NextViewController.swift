//
//  NextViewController.swift
//  SwiftButton
//
//  Created by Takahiro Kirifu on 2020/02/23.
//  Copyright © 2020 Takahiro Kirifu. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    @IBOutlet var changeLabel: UILabel!
    @IBOutlet var textPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    @IBAction func change(_ sender: Any) {
        textPass.resignFirstResponder()
        if textPass.text == "kanami" {
            changeLabel.text = "暗号が解除されました。"
        }else {
            changeLabel.text = "暗号が間違っています。"
        }
        
    }
   
}
