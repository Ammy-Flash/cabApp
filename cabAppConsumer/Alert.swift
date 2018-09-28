//
//  Alert.swift
//  DoTryCatch
//
//  Created by Sean Allen on 8/30/17.
//  Copyright © 2017 Sean Allen. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    class func showBasic(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
    class func toast(title: String, message: String, vc: UIViewController,time : Double) {
        let alert = UIAlertController(title:title, message:message, preferredStyle: UIAlertController.Style.alert)
        vc.present(alert, animated: true) {
            Timer.scheduledTimer(withTimeInterval:time , repeats: false, block: {_ in
                vc.dismiss(animated: true, completion: nil)
            })
        }
    }
}
