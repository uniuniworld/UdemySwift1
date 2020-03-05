//
//  ViewController.swift
//  ProtocolBasicApp1
//
//  Created by Takahiro Kirifu on 2020/03/03.
//  Copyright © 2020 Takahiro Kirifu. All rights reserved.
//

import UIKit

// プロトコルを宣言
class ViewController: UIViewController,CatchProtocol {
    
    @IBOutlet weak var label: UILabel!
    
    var count:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    func catchData(count: Int) {
        
        label.text = String(count)
        
        
    }
    
    @IBAction func next(_ sender: Any) {
        
        performSegue(withIdentifier: "next", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let nextVC = segue.destination as! NextViewController
        nextVC.delegate = self
        
    }
    

}

