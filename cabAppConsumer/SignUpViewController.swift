//
//  SignUpViewController.swift
//  cabAppConsumer
//
//  Created by mac on 28/09/18.
//  Copyright © 2018 Dominator. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmField: UITextField!
    @IBOutlet weak var SgnUpButton: UIButton!
    let picker = UIImagePickerController()
    var imageData : Data!
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate =  self
        setUI()
       
    }
    
    func setUI()  {
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.layer.masksToBounds = true
        nameField.setShadowWithColor(color: UIColor.lightGray, opacity: nil, offset: CGSize(width: 3, height: 3), radius:2, viewCornerRadius: nil)
        phoneField.setShadowWithColor(color: UIColor.lightGray, opacity: nil, offset: CGSize(width: 3, height: 3), radius:2, viewCornerRadius: nil)
        emailField.setShadowWithColor(color: UIColor.lightGray, opacity: nil, offset: CGSize(width: 3, height: 3), radius:2, viewCornerRadius: nil)
        passwordField.setShadowWithColor(color: UIColor.lightGray, opacity: nil, offset: CGSize(width: 3, height: 3), radius:2, viewCornerRadius: nil)
        confirmField.setShadowWithColor(color: UIColor.lightGray, opacity: nil, offset: CGSize(width: 3, height: 3), radius:2, viewCornerRadius: nil)
        SgnUpButton.setShadowWithColor(color: UIColor.lightGray, opacity: nil, offset: CGSize(width: 3, height: 3), radius:2, viewCornerRadius: nil)
    }

    @IBAction func imagetapped(_ sender: Any) {
        let alert = UIAlertController(title: "Upload Image from:", message: "", preferredStyle: UIAlertController.Style.actionSheet)
        let camera = UIAlertAction(title: "Camera", style: UIAlertAction.Style.default) { (cam) in
            self.actionCamera()
        }
        let gall = UIAlertAction(title: "Gallery", style: UIAlertAction.Style.default) { (gal) in
            self.galleryAction()
        }
        let cancel = UIAlertAction(title: "cancel", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(cancel)
        alert.addAction(camera)
        alert.addAction(gall)
        self.present(alert, animated: true, completion: nil)
    }
    func galleryAction(){
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerController.SourceType.photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
        
    }
    func actionCamera()
    {
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            picker.allowsEditing = true
            picker.sourceType = UIImagePickerController.SourceType.camera
            picker.cameraCaptureMode = .photo
            picker.modalPresentationStyle = .fullScreen
            present(picker,animated: true,completion: nil)
        } else {
            noCamera()
        }
    }
    func noCamera(){
        let alertVC = UIAlertController(
            title: "No Camera",
            message: "Sorry, this device has no camera",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.default,
            handler: nil)
        alertVC.addAction(okAction)
        present(
            alertVC,
            animated: true,
            completion: nil)
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "signUp"{
            //MARK: Validation
            if nameField.text != ""{
                if phoneField.text != ""{
                    if phoneField.text?.count == 10{
                        if emailField.text != ""{
                            if emailField.text!.isValidEmail{
                                if passwordField.text != ""{
                                    if confirmField.text != ""{
                                        if confirmField.text == passwordField.text{
                                            
                                            //Mark: TODO register user  in server
                                            return true
                                            
                                        }else{
                                            Alert.showBasic(title: "Invalid Input", message: "password does not match", vc: self)
                                        }
                                    }else{
                                        Alert.showBasic(title: "Empty Field", message: "please confirm your password", vc: self)
                                    }
                                }else{
                                    Alert.showBasic(title: "Empty Field", message: "please enter password", vc: self)
                                }
                            }else{
                            Alert.showBasic(title: "Invalid Input", message: "please check your email id", vc: self)
                            }
                        }else{                    Alert.showBasic(title: "Empty Field", message: "please enter your email id", vc: self)
                        }
                    }else{
                       Alert.showBasic(title: "Invalid Input", message: "please check your phone number", vc: self)
                    }
                }else{
                    Alert.showBasic(title: "Empty Field", message: "please enter your phone number", vc: self)
                }
            }else{
                Alert.showBasic(title: "Empty Field", message: "please enter your name", vc: self)
            }
            return false
        }
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}
extension SignUpViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                var  chosenImage = UIImage()
                chosenImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage //2
                profileImageView.image = chosenImage
                dismiss(animated:true, completion: nil) //5
                imageData = chosenImage.jpegData(compressionQuality: 0.2)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        dismiss(animated: true, completion: nil)
    }
}
