//
//  CourseList.swift
//  xplat
//
//  Created by JC on 04/12/2020.
//

import SwiftUI

struct CourseContentList: View {
    @ViewBuilder
    var body: some View {
        
        #if os(iOS)
        content
            .listStyle(InsetGroupedListStyle())
        #else
        content
            .frame(minWidth: 800, minHeight: 600)
        #endif
    }
    
    var content : some View {
        List(0 ..< 20) { item in
            CourseRow()
        }
        .navigationTitle("Courses")
        
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseContentList()
    }
}
