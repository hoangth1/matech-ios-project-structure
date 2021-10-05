//
//  Utils.swift
//  ProjectStructure
//
//  Created by M1 on 10/5/21.
//

import Foundation


func runOnMainThread(action: @escaping ()->Void){
    DispatchQueue.main.async {
        action()
    }
}

func runOnBackgroundThread(action: @escaping () -> Void) {
    DispatchQueue.global(qos: .background).async{
        action()
    }
}

func currentTimeInMilliSeconds()-> Int{
    let currentDate = Date()
    let since1970 = currentDate.timeIntervalSince1970
    return Int(since1970 * 1000)
}


func printCaughtError(_ unknownError : Error) {
    let objectDescription = String(describing: unknownError)
    let localizedDescription = unknownError.localizedDescription
    if localizedDescription != "" {
       if localizedDescription.contains(objectDescription) {
          print("😍 \(localizedDescription)")
          return
       }
       if !objectDescription.contains(localizedDescription) {
          print("😍" + objectDescription + ": " + localizedDescription)
          return
       }
    }
    print("😍 \(objectDescription)")
 }
