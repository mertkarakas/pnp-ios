//
//  UIViewController+Extensions.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

import UIKit

extension UIViewController {

    static func instantiate<T>() -> T {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(identifier: "\(T.self)") as! T
        return controller
    }

    func showAlert(with title:String?, message:String?) {

        let alertController = UIAlertController(title: title, message: message, preferredStyle:UIAlertController.Style.alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        { action -> Void in
        })
        present(alertController, animated: true, completion: nil)
    }
}
