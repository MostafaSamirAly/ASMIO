//
//  UIViewController+Ext.swift
//  Expert
//
//  Created by Mac Store Egypt on 30/05/2021.
//  Copyright © 2021 Mostafa Samir. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func push(_ viewController: UIViewController) {
        navigationController?.fadeTo(viewController)
    }
    
    func pop() {
        navigationController?.fadeOut()
    }
    
    func popToRoot() {
        navigationController?.popRoot()
        dismiss()
    }

    func present(_ viewController:UIViewController) {
        present(viewController, animated: true, completion: nil)
    }
    
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    func setRootViewController(vc: UIViewController) {
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.isNavigationBarHidden = true
        UIApplication.shared.windows.first?.rootViewController = navigationController
    }
}
