//
//  UINavigationItem+Extensions.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

import UIKit

extension UINavigationItem {

    public func removeBackBarButtonTitle() {
        backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
    }
}
