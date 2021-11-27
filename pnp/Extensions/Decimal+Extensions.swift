//
//  Decimal+Extensions.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

import Foundation

extension Decimal {

    func convertToString() -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.locale = Locale(identifier: "tr_TR")
        let string = numberFormatter.string(from: self as NSNumber)
        guard let str = string else {
            return nil
        }
        return str + " IZT"
    }
}
