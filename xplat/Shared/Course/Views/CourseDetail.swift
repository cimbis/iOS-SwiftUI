//
//  CourseDetail.swift
//  xplat
//
//  Created by JC on 05/12/2020.
//

import SwiftUI

struct CourseDetail: View {
    @State var showModal = false

    var course: Course = courseList[0]
    var namespace: Namespace.ID
    
    #if os(iOS)
    var cornerRadiusForPlatfrom: CGFloat = 10
    #else
    var cornerRadiusForPlatfrom: CGFloat = 0
    #endif
    
    
    var body: some View {
        #if os(iOS)
        courseDetails
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        #else
        courseDetails
        #endif
    }
    
    var courseDetails: some View {
        VStack {
            ScrollView {
                CourseLogo(course: course, cornerRadiusForPlatfrom: 0)
                    .matchedGeometryEffect(id: course.id, in: namespace)
                    .frame(height: 300)
                Spacer()
                VStack {
                    ForEach(courseSections) { item in
                        CourseRow(item: item)
                            .sheet(isPresented: $showModal) {
                                   CourseSectionDetail()
                            }
                            .onTapGesture {
                                showModal = true
                            }
                        Divider()
                    }
                }
                .padding()
            }
        }
        .background(Color("Background 1"))
        .clipShape(RoundedRectangle(cornerRadius: cornerRadiusForPlatfrom, style: .continuous))
        .matchedGeometryEffect(id: "container\(course.id)", in: namespace)
    }
}

struct CourseDetail_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        CourseDetail(namespace: namespace)
            .preferredColorScheme(.dark)
    }
}
