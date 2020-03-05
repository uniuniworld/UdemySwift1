//
//  ViewController.swift
//  CalcApp
//
//  Created by Takahiro Kirifu on 2020/02/24.
//  Copyright © 2020 Takahiro Kirifu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var carModel = Car()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carModel.frontWheel = 10
        carModel.reerWheel = 10
        
    }

    
    @IBAction func doAction(_ sender: Any) {
        
        print("aaa")
        
        carModel.drive()
        carModel.move(toBack: "後ろに行くよ！")
        let total = carModel.plusAndMinus(num1: carModel.frontWheel, num2: carModel.reerWheel)
        print("タイヤの合計数　\(total)")
    }
    
}
