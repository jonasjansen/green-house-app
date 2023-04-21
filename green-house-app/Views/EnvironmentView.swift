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
                    Text("Temperature:")
                    Spacer()
                    Text(item.temperature)
                }
                HStack {
                    Text("Humidity:")
                    Spacer()
                    Text(item.humidity)
                }
                HStack {
                    Text("Moisture:")
                    Spacer()
                    Text(item.moisture)
                }
                HStack {
                    Text("Light:")
                    Spacer()
                    Text(item.light_state)
                }
                HStack {
                    Text("Heating:")
                    Spacer()
                    Text(item.heating_state)
                }
                HStack {
                    Text("Updated at:")
                    Spacer()
                    Text(item.timestamp)
                }
            }
        }.frame(maxWidth: 300)
        VStack {
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
