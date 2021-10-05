//
//  UILabelExtension.swift
//  BaseiOS
//
//  Created by Hoang on 01/05/2021.
//

import UIKit

extension UILabel{
   
   func setTextWithTypeAnimation(id:String, typedText: String, pauseCharacterArray: [Int:Double], characterInterval: TimeInterval = 0.033 ) {
       
       text = ""
       
       let group = DispatchGroup()
       group.enter()
       
       DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: DispatchTime.now() + 1.3, execute: {
           
           for (_, character) in typedText.enumerated() {
               
               DispatchQueue.main.async {
                   self.text = self.text! + String(character)
               }
               
               Thread.sleep(forTimeInterval: characterInterval)
           }
           
           group.leave()
       })
       
       group.notify(queue: .main) {
           //do something
       }
   }
}
extension UILabel{
   func outline(string:String, font:String, size:CGFloat, outlineSize:Float, textColor:UIColor, outlineColor:UIColor) -> NSMutableAttributedString {
       return NSMutableAttributedString(string:string,
                                        attributes: outlineAttributes(font: UIFont(name: font, size: size)!,
                                                           outlineSize: outlineSize, textColor: textColor, outlineColor: outlineColor))
   }

   func outlineAttributes(font: UIFont, outlineSize: Float, textColor: UIColor, outlineColor: UIColor) -> [NSAttributedString.Key: Any]{
       return [
           NSAttributedString.Key.strokeColor : outlineColor,
           NSAttributedString.Key.foregroundColor : textColor,
           NSAttributedString.Key.strokeWidth : -outlineSize,
           NSAttributedString.Key.font : font
       ]
   }
   
   func strikeThrogh() {
       let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: self.text ?? "")
           attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
       attributeString.addAttribute(NSAttributedString.Key.strikethroughColor, value: UIColor.darkGray, range: NSMakeRange(0, attributeString.length))

       self.attributedText = attributeString
   }
}

