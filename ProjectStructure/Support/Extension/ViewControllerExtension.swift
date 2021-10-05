//
//  UIViewControllerExtension.swift
//  SecretPhoto
//
//  Created by Matech on 5/19/21.
//

import Foundation
import UIKit
import Photos

extension UIViewController{
    func showErrorMessage(onClickOk: (()->Void)? = nil){
        self.showMessage(title: "Error", message: "An error occurred. Please try again") { _ in
            onClickOk?()
        }
    }
    
    func showMessage(title:String?, message:String, handler: ((_ action:UIAlertAction)->Void)? = nil){
        let alert = UIAlertController(title:title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: handler))
        alert.overrideUserInterfaceStyle = .dark
        present(alert, animated: true, completion: nil)
    }
}
