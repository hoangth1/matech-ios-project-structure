//
//  UIViewControllerExtension.swift
//  BaseiOS
//
//  Created by M1 on 4/29/21.
//

import Foundation
import UIKit

extension UIViewController {
    
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
    
    
    // Method to prensent specific screen
    func goToScreen(viewController:UIViewController,isAnimated:Bool = true, modalPresentationStyle:UIModalPresentationStyle = .fullScreen, modalTransitionStyle: UIModalTransitionStyle = .coverVertical,onShowComplete: (()->Void)? = nil){
        viewController.modalTransitionStyle = modalTransitionStyle
        viewController.modalPresentationStyle = modalPresentationStyle
        UIApplication.getTopViewController()?.present(viewController, animated: isAnimated, completion: onShowComplete)
    }
    
    // Method to blur ViewController
    func overlayBlurredBackgroundView() {

        let blurredBackgroundView = UIVisualEffectView()
        blurredBackgroundView.frame = view.frame
        blurredBackgroundView.effect = UIBlurEffect(style: .dark)
        view.addSubview(blurredBackgroundView)
    }

    //Method to remove blur ViewController
    func removeBlurredBackgroundView() {
        for subview in view.subviews {
            if subview.isKind(of: UIVisualEffectView.self) {
                subview.removeFromSuperview()
            }
        }
    }
    
    @discardableResult
    func addContainedChildViewController<T: UIViewController>(_ vc: T.Type, onView: UIView) -> T {

        let viewController = vc.init()
        onView.addSubview(viewController.view)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewController.view.leadingAnchor.constraint(equalTo: onView.leadingAnchor),
            viewController.view.trailingAnchor.constraint(equalTo: onView.trailingAnchor),
            viewController.view.topAnchor.constraint(equalTo: onView.topAnchor),
            viewController.view.bottomAnchor.constraint(equalTo: onView.bottomAnchor)
            ])

        addChild(viewController)
        return viewController

    }
    
    func viewcontrollerTransition(vc: UIViewController, position: CATransitionSubtype = .fromRight){
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        trainsition(position: position)
        present(vc, animated: false, completion: nil)
    }
    
    func dissmissTrainsition(position: CATransitionSubtype = .fromLeft){
        trainsition(position: position)
        dismiss(animated: false, completion: nil)
    }
    
    func trainsition(position: CATransitionSubtype = .fromRight){
        let transition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = position
        self.view.window!.layer.add(transition, forKey: nil)
    }
    
    func hideKeyboardWhenTappedArroudn() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
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
