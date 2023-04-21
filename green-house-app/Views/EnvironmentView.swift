//
//  EnvironmentView.swift
//  green-house-app
//
//  Created by Jonas Jansen on 21.04.23.
//

import SwiftUI
import Firebase

struct EnvironmentView: View {
    
    @ObservedObject var model = ViewModelEnvironment()
    @State var name = ""
    @State var notes = ""
    
    var body: some View {
        VStack {
            List (model.list) { item in
                
                HStack {
                    Text(item.id)
                    Spacer()
                }
            }
            Button(action: {
                model.getData()
            }, label: {
                Text("Reload Environment")
            })
        }  
    }
    init() {
        model.getData()
    }
}
