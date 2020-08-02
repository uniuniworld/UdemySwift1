//
//  ChatViewController.swift
//  Chatapp
//
//  Created by Takahiro Kirifu on 2020/07/22.
//  Copyright © 2020 Takahiro Kirifu. All rights reserved.
//

import UIKit
import ChameleonFramework
import Firebase

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    let screenSize = UIScreen.main.bounds.size
    
    var chatArray = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        messageTextField.delegate = self
        
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "Cell")
        // 高さが可変
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        
        // keybord
        NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.keyboardWillShow(_ :)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.keyboardWillHide(_ :)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // Fierbaseからデータをfetchしてくる
        fetchChatData()
        
        tableView.separatorStyle = .none
        
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        
        let keyboardHeight = ((notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as Any) as AnyObject).cgRectValue.height
        
        messageTextField.frame.origin.y = screenSize.height - keyboardHeight - messageTextField.frame.height
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        
        messageTextField.frame.origin.y = screenSize.height - messageTextField.frame.height
        
        guard let rect = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue, let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else {return}
        
        UIView.animate(withDuration: duration) {
            let transform = CGAffineTransform(translationX: 0, y: 0)
            self.view.transform = transform
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        messageTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // メッセージの数
        return chatArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        
        cell.messageLabel.text = chatArray[indexPath.row].message
        cell.userNameLabel.text = chatArray[indexPath.row].sender
        cell.iconImageView.image = UIImage(named: "dogAbatarImage")
        
        if cell.userNameLabel.text == Auth.auth().currentUser?.email as! String {
            
            cell.messageLabel.backgroundColor = UIColor.flatLime()
            cell.messageLabel.layer.cornerRadius = 20
            cell.messageLabel.layer.masksToBounds = true
            
        } else {
            
            cell.messageLabel.backgroundColor = UIColor.flatGray()
            cell.messageLabel.layer.cornerRadius = 20
            cell.messageLabel.layer.masksToBounds = true
            
        }
        
        cell.messageLabel.backgroundColor = UIColor.flatLime()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @IBAction func sendAction(_ sender: Any) {
        
        messageTextField.endEditing(true)
        messageTextField.isEnabled = false
        sendButton.isEnabled = false
        
        let alert = UIAlertController(title: "警告", message: "15文字以上です。", preferredStyle: UIAlertController.Style.alert)
        
        if messageTextField.text!.count > 15 {
            
            present(alert, animated: true, completion: nil)
            print("１５文字以上です。")
            return
        }
        
        let chatDB = Database.database().reference().child("chats")
        
        // キーバリュー型で内容を送信 辞書型 Dictionary
        let messageInfo = ["sender": Auth.auth().currentUser?.email, "message": messageTextField.text]
        
        // chatDBに入れる
        chatDB.childByAutoId().setValue(messageInfo) { (error, result) in
            if error != nil {
                print(error as Any)
            } else {
                print("送信完了！")
                self.messageTextField.isEnabled = true
                self.sendButton.isEnabled = true
                self.messageTextField.text = ""
                
            }
        }
    }
    
    // 受信　引っ張ってくる
    func fetchChatData() {
        
        let fetchDataRef = Database.database().reference().child("chats")
        
        // 更新があったときだけ取得
        fetchDataRef.observe(.childAdded) { (snapShot) in
            
            let snapShotData = snapShot.value as! AnyObject
            let text = snapShotData.value(forKey: "message")
            let sender = snapShotData.value(forKey: "sender")
            let message = Message()
            message.message = text as! String
            message.sender = sender as! String
            self.chatArray.append(message)
            self.tableView.reloadData()
            
        }
    }
}
