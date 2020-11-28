//
//  ContentView.swift
//  Shared
//
//  Created by Janis Cimbulis on 28/11/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Image("Illustration 1")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("One two three")
                .font(.body)
                .fontWeight(.bold)
            Text("20 sections")
                .font(.footnote)
        }
        .padding(.all)
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
        .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
        .shadow(radius: 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
    }
}
