//
//  ViewController.swift
//  Swift5TableViewBasic
//
//  Created by Takahiro Kirifu on 2020/03/03.
//  Copyright © 2020 Takahiro Kirifu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textField: UITextField!
    
    var textArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        
    }
    
    
    // セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return textArray.count
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    // セルの中身
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.selectionStyle = .none
        
        cell.textLabel?.text = textArray[indexPath.row]
        
        cell.imageView!.image = UIImage(named: "checkImage")
        
        return cell
        
    }
    // セルがタップされたとき
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //　タップしたときにその配列の番号の中身を取り出して値を渡す
        let nextVC = storyboard?.instantiateViewController(identifier: "next") as! NextViewController
        
        nextVC.toDoString = textArray[indexPath.row]
        
        navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // 画面の６分割
        return view.frame.size.height/6
        
    }
    
    // returnkeyが押されたとき
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //if textField.text =
        textArray.append(textField.text!)
        // キーボードを閉じる
        textField.resignFirstResponder()
        textField.text = ""
        tableView.reloadData()
        
        return true
        
    }


}

