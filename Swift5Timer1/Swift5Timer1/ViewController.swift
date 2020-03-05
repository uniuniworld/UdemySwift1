//
//  ViewController.swift
//  Swift5Timer1
//
//  Created by Takahiro Kirifu on 2020/02/23.
//  Copyright © 2020 Takahiro Kirifu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var timer = Timer()
    
    var count = Int()
    
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        count = 0
        
        // stopButtonを押せなくする
        stopButton.isEnabled = false
        
        for i in 0..<5{
            let image = UIImage(named: "\(i)")
            imageArray.append(image!)
        }
        
        imageView.image = UIImage(named: "0")
        
    }
    
    func startTimer() {
        // タイマーを回す　0.2秒ごとにあるメソッドを呼ぶ
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    // 0.2秒ごとに呼ばれる
    @objc func timerUpdate() {
        
        count = count + 1
        
        if count > 4 {
            count = 0
        }
        
        imageView.image = imageArray[count]
        
    }

    @IBAction func start(_ sender: Any) {
        
        startTimer()
        // imageViewのimageに画像を反映していく
        
        // startButtonを押せなくする
        startButton.isEnabled = false
        stopButton.isEnabled = true
    }
    
    @IBAction func stop(_ sender: Any) {
        // imageViewの画像がストップ
        
        // startButtonを押せなくする
        startButton.isEnabled = true
        stopButton.isEnabled = false
        
        timer.invalidate()

    }
    
}

