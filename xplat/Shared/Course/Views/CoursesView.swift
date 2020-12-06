//
//  CoursesView.swift
//  xplat
//
//  Created by JC on 04/12/2020.
//

import SwiftUI

struct CoursesView: View {
    @Namespace var namespace
    @Namespace var namespace2
    
    @State var show = false
    @State var selectedItem: Course? = nil
    @State var isDisabled = false
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    var openCloseAnimation: Animation = .spring(response: 0.4, dampingFraction: 0.8, blendDuration: 0)
    
    
    var body: some View {
        ZStack {
            #if os(iOS)
            if horizontalSizeClass == .compact {
                tabBar
            } else {
                sideBar
            }
            
            maximizedCourseView
                .background(
                    VisualEffectBlur(blurStyle: .systemChromeMaterial)
                        .edgesIgnoringSafeArea(.all)
                )
            
            #else
            minimizedCourseView
            maximizedCourseView
                .background(
                    VisualEffectBlur()
                        .edgesIgnoringSafeArea(.all)
                )
            #endif
        }
        .navigationTitle("Courses")
    }
    
    @ViewBuilder
    var minimizedCourseView: some View {
        ScrollView {
            VStack(spacing: 0) {
                courseGrid
                latestSections
            }
        }
        .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
        .navigationTitle("Courses")
    }
    
    @ViewBuilder
    var CloseButtonWithOptions: some View {
        CloseButton()
            .padding(16)
            .onTapGesture {
                withAnimation(openCloseAnimation) {
                    show.toggle()
                    selectedItem = nil
                    DispatchQueue
                        .main
                        .asyncAfter(deadline: .now() + 0.5) {
                            isDisabled = false
                        }
                }
            }
    }
    
    @ViewBuilder
    var maximizedCourseView: some View {
        if selectedItem != nil {
            ZStack(alignment: .topTrailing) {
                CourseDetail(course: selectedItem!, namespace: namespace)
                CloseButtonWithOptions
            }
            .zIndex(1.1)
            .frame(maxWidth: 712)
            .frame(maxWidth: .infinity)
        }
    }
    
    var tabBar: some View {
        TabView {
            NavigationView{
                minimizedCourseView
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
    
    @ViewBuilder
    var sideBar: some View {
        #if os(iOS)
        NavigationView {
            List {
                NavigationLink(destination: minimizedCourseView) {
                    Label("Courses", systemImage: "book.closed")
                }
                Label("Tutorials", systemImage: "list.bullet.rectangle")
                Label("Livestreams", systemImage: "tv")
                Label("Certificates", systemImage: "mail.stack")
                Label("Search", systemImage: "magnifyingglass")
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Learn")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "person.crop.circle")
                }
            })
            
            minimizedCourseView
        }
        #endif
    }
    
    @ViewBuilder
    var courseGrid: some View {
        LazyVGrid (
            columns:  [GridItem(.adaptive(minimum: 200), spacing: 16)],
            spacing: 16
        ) {
            ForEach(courseList) { course in
                VStack {
                    CourseLogo(course: course)
                        .matchedGeometryEffect(id: course.id, in: namespace, isSource: !show)
                        .frame(height: 200)
                        .onTapGesture {
                            withAnimation(openCloseAnimation) {
                                show.toggle()
                                selectedItem = course
                                isDisabled = true
                            }
                        }
                        .disabled(isDisabled)
                }
                .matchedGeometryEffect(id: "container\(course.id)", in: namespace, isSource: !show)
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    var latestSections: some View {
        Text("Latest Sections")
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        
        LazyVGrid(
            columns: [ GridItem(.adaptive(minimum: 240)) ]
        ) {
            ForEach(courseSections) { section in
                #if os(iOS)
                NavigationLink(destination: CourseDetail(namespace: namespace2)) {
                    CourseRow(item: section)
                }
                
                #else
                CourseRow(item: section)
                
                #endif
            }
        }
        .padding()
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
            .preferredColorScheme(.dark)
    }
}
