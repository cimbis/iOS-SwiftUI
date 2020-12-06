//
//  CloseButton.swift
//  xplat
//
//  Created by JC on 05/12/2020.
//

import SwiftUI

struct CloseButton: View {
    var body: some View {
        Image(systemName: "xmark")
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(Color.white)
            .padding(.all, 10)
            .background(Color.black.opacity(0.5))
            .clipShape(Circle())
        
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton()
    }
}
