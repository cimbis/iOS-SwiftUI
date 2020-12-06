//
//  ContentView.swift
//  Shared
//
//  Created by Janis Cimbulis on 28/11/2020.
//

import SwiftUI

struct ContentView: View {
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
    @ViewBuilder
    var body: some View {
        #if os(iOS)
//        if horizontalSizeClass == .compact {
//            TabBar()
//        } else {
//            Sidebar()
//        }
        CoursesView()
        
        #else
        Sidebar()
            .frame(minWidth: 1000, minHeight: 600)
        
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
    }
}
