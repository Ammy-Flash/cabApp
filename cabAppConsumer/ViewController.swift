//
//  ViewController.swift
//  cabAppConsumer
//
//  Created by mac on 28/09/18.
//  Copyright © 2018 Dominator. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var copanyLogoImageview: UIImageView!
    
    @IBOutlet weak var emailField: UITextField!
        @IBOutlet weak var passWordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func setUI()  {
        emailField.setShadowWithColor(color: UIColor.lightGray, opacity: nil, offset: CGSize(width: 3, height: 3), radius:2, viewCornerRadius: nil)
        passWordField.setShadowWithColor(color: UIColor.lightGray, opacity: nil, offset: CGSize(width: 3, height: 3), radius:2, viewCornerRadius: nil)
        loginButton.setShadowWithColor(color: UIColor.lightGray, opacity: nil, offset: CGSize(width: 3, height: 3), radius:2, viewCornerRadius: nil)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "login"{
            if emailField.text != ""{
                if emailField.text!.isValidEmail{
                    if passWordField.text != ""{
                        if passWordField.text == "1234" && emailField.text == "abc@gmail.com"{
                            //present home vc
                            return true
                        }else{
                            Alert.showBasic(title: "Invalid credentials", message: "please check your id & password", vc: self)
                        }
                    }else{
                        Alert.showBasic(title: "Empty Field", message: "please enter your password", vc: self)
                    }
                }else{
                    Alert.showBasic(title: "Invalid input", message: "please check your email &  try again!", vc: self)
                }
            }else{
                Alert.showBasic(title: "Empty Field", message: "please enter your email id", vc: self)
            }
            return false
        }
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

