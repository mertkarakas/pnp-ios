//
//  CampaignModel.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

import Foundation

struct CampaignModel {
    let title: String?
    let description: String?
    let maxAmount: Decimal?
    let reachedAmount: Decimal?
    let image: Data?

    func calculatedProgress() -> Float {
        NSDecimalNumber(decimal: reachedAmount ?? 0).floatValue / NSDecimalNumber(decimal: maxAmount ?? 0).floatValue 
    }

    func percentage() -> Int {
        Int(calculatedProgress() * 100)
    }
}
