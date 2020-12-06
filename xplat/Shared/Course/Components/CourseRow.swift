//
//  CourseRow.swift
//  xplat
//
//  Created by JC on 04/12/2020.
//

import SwiftUI

struct CourseRow: View {
    var item: CourseSection = courseSections[0]
    
    var body: some View {
        HStack(alignment: .center) {
            Image(item.logo)
                .renderingMode(.original)
                .frame(width: 48.0, height: 48.0)
                .imageScale(.large)
                .background(item.color)
                .clipShape(Circle())
                .foregroundColor(Color.white)
            VStack(alignment: .leading, spacing: 4.0) {
                Text(item.title)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.primary)
                Text(item.subtitle)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}

struct CourseRow_Previews: PreviewProvider {
    static var previews: some View {
        CourseRow()
    }
}
