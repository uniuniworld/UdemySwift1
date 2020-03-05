//
//  ViewController.swift
//  Swift5CountUp1
//
//  Created by Takahiro Kirifu on 2020/02/23.
//  Copyright © 2020 Takahiro Kirifu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countUpLabel: UILabel!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ラベル文字を0
        countUpLabel.text = "0"
        
    }

    @IBAction func plus(_ sender: Any) {
        
        //　カウントアップ
        count = count + 1
        //　ラベルに文字を反省　数字
        countUpLabel.text = String(count)
        // 色を10以上になったら黄色
        if count >= 10 {
            changeTextColor()
        }
    }
    
    @IBAction func minus(_ sender: Any) {
        
        //　カウントダウン
        count = count - 1
        //　ラベルに文字を反省　数字
        countUpLabel.text = String(count)
        // 色を9以下になったら白色
        if count <= 9 {
            resetTextColor()
        }
    }
    // 新しいメソッドが作成された
    func changeTextColor(){
        countUpLabel.textColor = .yellow
    }
    
    func resetTextColor(){
        countUpLabel.textColor = .white
    }
    
}

