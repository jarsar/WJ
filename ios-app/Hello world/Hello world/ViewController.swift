//
//  ViewController.swift
//  Hello world
//
//  Created by jarson on 2017/9/18.
//  Copyright © 2017年 jarson. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate ,
UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var nameLabelfield: UILabel!
    @IBOutlet weak var writeTextfield: UITextField!
    @IBOutlet weak var photoimageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        writeTextfield.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        nameLabelfield.text=textField.text
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        photoimageView.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        writeTextfield.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
}

