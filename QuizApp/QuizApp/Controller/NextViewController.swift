//
//  NextViewController.swift
//  QuizApp
//
//  Created by Takahiro Kirifu on 2020/03/07.
//  Copyright © 2020 Takahiro Kirifu. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var correctLabel: UILabel!
    
    @IBOutlet weak var wrongLabel: UILabel!
    
    var correctedCount = Int()
    var wrongCount = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        correctLabel.text = String(correctedCount)
        wrongLabel.text = String(wrongCount)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
