//
//  SoundFile.swift
//  QuizApp
//
//  Created by Takahiro Kirifu on 2020/03/08.
//  Copyright © 2020 Takahiro Kirifu. All rights reserved.
//

import Foundation
import AVFoundation

class SoundFile{
    
    var player:AVAudioPlayer?
    //引数　ファイル名と拡張子
    func playSound(fileName:String,extensionName:String){
        
        //再生する
        let soundURL = Bundle.main.url(forResource: fileName, withExtension: extensionName)
        
        do{
            
            //効果音を鳴らす
            player = try AVAudioPlayer(contentsOf: soundURL!)
            player?.play()
            
        }catch{
            
            print("エラーです！")
            
        }
        
    }
    
    
}
