//
//  NextViewController.swift
//  ProtocolBasicApp1
//
//  Created by Takahiro Kirifu on 2020/03/03.
//  Copyright © 2020 Takahiro Kirifu. All rights reserved.
//

import UIKit

protocol CatchProtocol {
    
    // 規則を決める　どのメソッドのことか
    func catchData(count:Int)
    
}


class NextViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var count:Int = 0
    
    // プロトコルを変数化
    var delegate:CatchProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func plusAction(_ sender: Any) {
        
        count = count + 1
        label.text = String(count)
        
        
    }
    
    @IBAction func back(_ sender: Any) {
        
        // 発動させる
        delegate?.catchData(count: count)
        // 画面戻る
        dismiss(animated: true, completion: nil)
        
    }
}
