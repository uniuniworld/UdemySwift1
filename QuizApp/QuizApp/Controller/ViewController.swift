//
//  ViewController.swift
//  QuizApp
//
//  Created by Takahiro Kirifu on 2020/03/07.
//  Copyright © 2020 Takahiro Kirifu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,NowScoreDelegate{
        

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var maxScoreLabel: UILabel!
    
    var correctCount = 0
    var wrongCount = 0
    var maxScore = 0
    var questionNumber = 0
    
    let imagesList = ImagesList()
    
    //IBActionで検知した正答がどちらなのかを取得する変数
    var pickedAnswer = false
    
    let sountFile = SoundFile()
    
    var changeColor = ChangeColor()
    var gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientLayer = changeColor.changeColor(topR: 0.07, topG: 0.13, topB: 0.26, topAlpha: 1.0, bottomR: 0.54, bottomG: 0.74, bottomB: 0.74, bottomAlpha: 1.0)
        
        gradientLayer.frame = view.bounds
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        imageView.layer.cornerRadius = 20.0
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        correctCount = 0
        wrongCount = 0
        questionNumber = 0
        
        imageView.image = UIImage(named: imagesList.list[0].imageText)
        
        if UserDefaults.standard.object(forKey: "beforeCount") != nil{
            
            maxScore = UserDefaults.standard.object(forKey: "beforeCount") as! Int
            
        }
        
        maxScoreLabel.text = String(maxScore)
        
    }
    

    @IBAction func answer(_ sender: Any) {
        
        if (sender as AnyObject).tag == 1{
            
            sountFile.playSound(fileName: "maruSound", extensionName: "mp3")
            
            pickedAnswer = true
            
            
            //丸が押されたとき
            
            //ユーザーが押したボタンが丸だった
            
            //丸ボタン音声を流す
        }else if (sender as AnyObject).tag == 2{
            
            sountFile.playSound(fileName: "batsuSound", extensionName: "mp3")
            
            pickedAnswer = false
            
            //バツが押されたとき
            
            //ユーザーが押したボタンがバツだった
            
            //バツボタン音声を流す
        }
        
        //チェック 回答があっているか（pickedAnserとcorrectAnwserが一致しているか）
        check()
        nextQuestions()
        
        
        
    }
    func check(){
        let correctAnswer = imagesList.list[questionNumber].answer
        //チェック 回答があっているか（pickedAnserとcorrectAnwserが一致しているか）
        if correctAnswer == pickedAnswer{
            
            print("正解")
            correctCount = correctCount + 1
            
        }else{
            
            print("不正解")
            wrongCount = wrongCount + 1
            
        }
    }
    func nextQuestions(){
        if questionNumber <= 9{
            questionNumber = questionNumber + 1
            imageView.image = UIImage(named: imagesList.list[questionNumber].imageText)
        }else{
            print("問題終了")
            
            performSegue(withIdentifier: "next", sender: nil)
            
            
        }
    }
    
    func nowScores(score: Int) {
        
        sountFile.playSound(fileName: "sound", extensionName: "mp3")
        maxScoreLabel.text = String(score)
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "next"{
            let nextVC = segue.destination as! NextViewController
            nextVC.correctedCount = correctCount
            nextVC.wrongCount = wrongCount
            nextVC.delegate = self
        }
        
    }
    
    @IBAction func scoreReset(_ sender: Any) {
        
        UserDefaults.standard.set(0, forKey: "beforeCount")
        
        maxScore = UserDefaults.standard.object(forKey: "beforeCount") as! Int
        
        maxScoreLabel.text = String(maxScore)
        
    }
}

