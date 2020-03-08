//
//  ViewController.swift
//  Swift5CameraAlbum
//
//  Created by Takahiro Kirifu on 2020/03/08.
//  Copyright © 2020 Takahiro Kirifu. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var backImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PHPhotoLibrary.requestAuthorization { (status) in
            
            switch(status){
                
                case.authorized:
                    print("許可されています")
                
                case.denied:
                    print("拒否されました")
                
                case.notDetermined:
                    print("notDererminde")
                
                case.restricted:
                    print("restricted")

            }
            
        }
        
        
    }


    @IBAction func openCamera(_ sender: Any) {
        
        let sourceType = UIImagePickerController.SourceType.camera
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            let camaraPicker = UIImagePickerController()
            camaraPicker.sourceType = sourceType
            camaraPicker.delegate = self
            camaraPicker.allowsEditing = true
            present(camaraPicker,animated: true,completion: nil)
            
        }else{
            
            print("エラー")
            
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func openAlbum(_ sender: Any) {
        
        let sourceType = UIImagePickerController.SourceType.photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            let camaraPicker = UIImagePickerController()
            camaraPicker.sourceType = sourceType
            camaraPicker.delegate = self
            camaraPicker.allowsEditing = true
            present(camaraPicker,animated: true,completion: nil)
            
        }else{
            
            print("エラー")
            
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.editedImage] as? UIImage{
            backImageView.image = pickedImage
            
            //写真の保存
            UIImageWriteToSavedPhotosAlbum(pickedImage, self, nil, nil)
            
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    //シェアするための機能
    
   
    @IBAction func share(_ sender: Any) {
        
        let text = "#kirifu.work"
        let image = backImageView.image?.jpegData(compressionQuality: 0.2)
        let items = [text,image] as [Any]
        
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
    
}

