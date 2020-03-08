//
//  NextViewController.swift
//  QuizApp
//
//  Created by Takahiro Kirifu on 2020/03/07.
//  Copyright © 2020 Takahiro Kirifu. All rights reserved.
//

import UIKit

protocol NowScoreDelegate {
    
    func nowScores(score:Int)
    
}

class NextViewController: UIViewController {

    @IBOutlet weak var correctLabel: UILabel!
    
    @IBOutlet weak var wrongLabel: UILabel!
    
    var correctedCount = Int()
    var wrongCount = Int()
    
    var delegate:NowScoreDelegate?
    
    var beforeCount = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        correctLabel.text = String(correctedCount)
        wrongLabel.text = String(wrongCount)
        
        if UserDefaults.standard.object(forKey: "beforeCount") != nil{
            
            beforeCount = UserDefaults.standard.object(forKey: "beforeCount") as! Int
            
        }
    }
    
    @IBAction func back(_ sender: Any) {
        
        //もし最高得点　入れ替え
        if beforeCount < correctedCount{
            UserDefaults.standard.set(correctedCount, forKey: "beforeCount")
            delegate?.nowScores(score: correctedCount)
        }else if beforeCount > correctedCount{
            //最高得点ではない　入れ替えない
            UserDefaults.standard.set(beforeCount, forKey: "beforeCount")
        }
        
        dismiss(animated: true, completion: nil)
        
    }
}
