//
//  TitleSubtitleCellModel.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 27.11.2021.
//

enum CellType {
    case titleSubtitle(TitleSubtitleCellModel)
}

struct TitleSubtitleCellModel {
    let title: String
    let subtitle: String?
    let placeholder: String?
}
