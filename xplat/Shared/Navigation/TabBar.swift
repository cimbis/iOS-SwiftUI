//
//  TabBar.swift
//  xplat (iOS)
//
//  Created by JC on 06/12/2020.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            NavigationView{
                CoursesView()
            }
            .tabItem {
                Image(systemName: "book.closed")
                Text("Courses")
            }
            
            NavigationView{
                CourseContentList()
            }
            .tabItem {
                Image(systemName: "list.bullet.rectangle")
                Text("Tutorials")
            }
            
            NavigationView{
                CourseContentList()
            }
            .tabItem {
                Image(systemName: "tv")
                Text("Livestreams")
            }
            
            NavigationView{
                CourseContentList()
            }
            .tabItem {
                Image(systemName: "mail.stack")
                Text("Certificates")
            }
            
            NavigationView{
                CourseContentList()
            }
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
