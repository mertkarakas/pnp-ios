//
//  CampaignModel.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

import Foundation

struct CampaignModel {
    let title: String
    let description: String
    let maxAmount: Decimal
    let reachedAmount: Decimal
    let image: String

    func calculatedProgress() -> Float {
        NSDecimalNumber(decimal: reachedAmount).floatValue / NSDecimalNumber(decimal: maxAmount).floatValue 
    }

    func percentage() -> Int {
        Int(calculatedProgress() * 100)
    }
}
