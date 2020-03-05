//
//  Car.swift
//  CalcApp
//
//  Created by Takahiro Kirifu on 2020/02/24.
//  Copyright © 2020 Takahiro Kirifu. All rights reserved.
//

import Foundation

class Car{
    
    var frontWheel = 0
    var reerWheel = 0
    
    // イニシャライズ 初期化
    init(){
        
        frontWheel = 0
        reerWheel = 0
        
    }
    
    // 機能
    func drive(){
        
        print("運転開始")
        print("前輪 \(frontWheel)")
        print("後輪 \(reerWheel)")
        
    }
    
    
    func move(toBack:String){
        
        print(toBack)
        
    }
    
    func plusAndMinus(num1:Int,num2:Int)->Int{
        
        return num1 + num2
        
    }
}
