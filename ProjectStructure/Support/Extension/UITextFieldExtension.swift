//
//  UITextFieldExtension.swift
//  SecretPhoto
//
//  Created by M1 on 6/29/21.
//

import Foundation
import UIKit

extension UITextField {
    
    func addUnderLine (distanceFromBottom:Int = 2) {
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0.0, y: self.bounds.height + CGFloat(distanceFromBottom), width: self.bounds.width, height: 0.5)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
