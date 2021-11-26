//
//  UIBarButtonItem+Extensions.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

import UIKit

extension UIBarButtonItem {

    static func withCustomButtonView(systemName: String, title: String, selector: Selector, target: Any?) -> UIBarButtonItem {

        let customButton = UIButton(type: .system)
        customButton.setImage(UIImage(systemName: systemName), for: .normal)
        customButton.setTitle(title, for: .normal)
        customButton.sizeToFit()
        customButton.addTarget(target, action: selector, for: .touchUpInside)
        return UIBarButtonItem(customView: customButton)
    }

    static func makeSignInButton(selector: Selector, target: Any?) -> UIBarButtonItem {
        UIBarButtonItem.withCustomButtonView(
            systemName: "rectangle.and.pencil.and.ellipsis",
            title: "Giriş Yap",
            selector: selector,
            target: target
        )
    }
}

