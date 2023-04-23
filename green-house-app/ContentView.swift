//
//  ContentView.swift
//  green-house-app
//
//  Created by Jonas Jansen on 17.04.23.
//

import SwiftUI
import FirebaseAnalyticsSwift

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .analyticsScreen(name:"Test")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
