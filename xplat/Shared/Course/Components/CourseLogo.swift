//
//  CourseItem.swift
//  xplat
//
//  Created by JC on 04/12/2020.
//

import SwiftUI

struct CourseLogo: View {
    var course: Course = courseList[0]
    #if os(iOS)
    var cornerRadiusForPlatfrom: CGFloat = 25
    #else
    var cornerRadiusForPlatfrom: CGFloat = 10
    #endif
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Spacer()
            HStack{
                Spacer()
                Image(course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
            Text(course.title)
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text(course.subtitle)
                .font(.footnote)
                .foregroundColor(.white)
        }
        .padding(.all)
        .cardStyle()
    }
}

struct CourseItem_Previews: PreviewProvider {
    static var previews: some View {
        CourseLogo()
    }
}
