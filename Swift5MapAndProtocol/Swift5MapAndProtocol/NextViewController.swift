//
//  NextViewController.swift
//  Swift5MapAndProtocol
//
//  Created by Takahiro Kirifu on 2020/03/04.
//  Copyright © 2020 Takahiro Kirifu. All rights reserved.
//

import UIKit

protocol SearchLocationDelegate {
    
    func searchLocation(idoValue:String,keidoValue:String)
    
}

class NextViewController: UIViewController {
    
    
    @IBOutlet weak var idoTextField: UITextField!
    
    @IBOutlet weak var keidoTextField: UITextField!
    
    var delegate:SearchLocationDelegate?
    
    //var idoValue = ""
    //var keidoValue = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //idoTextField.text = idoValue
        //keidoTextField.text = keidoValue

        // Do any additional setup after loading the view.
    }
    
    @IBAction func okAction(_ sender: Any) {
        
        // 入力された値を取得
        
        let idoValue = idoTextField.text!
        let keidoValue = keidoTextField.text!
        
        // 両方のTFが空でなければ戻る
        if idoTextField.text != nil || keidoTextField.text != nil{
            // デリゲートメソッドの引数に入れる
            delegate?.searchLocation(idoValue: idoValue, keidoValue: keidoValue)
            
            dismiss(animated: true, completion: nil)
            
        }
        
    }
}
