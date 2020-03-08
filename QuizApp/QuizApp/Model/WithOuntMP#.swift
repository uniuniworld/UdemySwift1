//
//  WithOuntMP#.swift
//  QuizApp
//
//  Created by Takahiro Kirifu on 2020/03/08.
//  Copyright © 2020 Takahiro Kirifu. All rights reserved.
//

import Foundation

class WithOutMP3:SoundFile{
    
    override func playSound(fileName: String, extensionName: String) {
        
        if extensionName == "MP3"{
            
            print("このファイルは再生できません。sorryyyyyy")
            
        }
        
        player?.stop()
        
    }
    
}
