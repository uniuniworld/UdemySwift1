//
//  imagesModel.swift
//  QuizApp
//
//  Created by Takahiro Kirifu on 2020/03/07.
//  Copyright © 2020 Takahiro Kirifu. All rights reserved.
//

import Foundation

class ImagesModel{
    
    //画像名を取得して、その画像名が人間かNOTかをフラグによって判定するための機能
    
    let imageText:String
    let answer:Bool
    
    init(imageName:String,correctOrNot:Bool){
        imageText = imageName
        answer = correctOrNot
    }
    
}
