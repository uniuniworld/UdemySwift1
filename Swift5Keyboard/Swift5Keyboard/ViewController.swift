//
//  ViewController.swift
//  Swift5Keyboard
//
//  Created by Takahiro Kirifu on 2020/02/25.
//  Copyright © 2020 Takahiro Kirifu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passWordTextField: UITextField!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var passWordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        userNameTextField.delegate = self
        passWordTextField.delegate = self
        
    }

    @IBAction func login(_ sender: Any) {
        
        //logoImageView.image = UIImage(named: "loginOK")
        
        userNameLabel.text = userNameTextField.text
        passWordLabel.text = passWordTextField.text
        
        performSegue(withIdentifier: "next", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "next"){
            let nextVC = segue.destination as! NextViewController
            nextVC.userName = userNameTextField.text!
            nextVC.passWord = passWordTextField.text!
        }
    }
    
    // タップでキーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
        
    }
    
    // returnkeyでキーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }
}

