//
//  LibraryContent.swift
//  xplat
//
//  Created by JC on 06/12/2020.
//

import SwiftUI

struct LibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(
            CloseButton(),
            title: "Close Button",
            category: .control
        )
    }
    
    @LibraryContentBuilder
    func modifiers(base: Image) -> [LibraryItem] {
        LibraryItem(
            base.cardStyle(color: Color.blue, cornerRadius: 25),
            title: "Card style",
            category: .effect
        )
    }
}

extension View {
    func cardStyle(color: Color, cornerRadius: CGFloat) -> some View {
        return self
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
            .shadow(color: color.opacity(0.5), radius: 7, x: 0, y: 4)
    }
}
