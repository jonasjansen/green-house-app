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
            HStack {
                Text("Temperature:")
                Spacer()
                Text(model.item.temperature)
            }
            HStack {
                Text("Humidity:")
                Spacer()
                Text(model.item.humidity)
            }
            HStack {
                Text("Moisture:")
                Spacer()
                Text(model.item.moisture)
            }
            HStack {
                Text("Light:")
                Spacer()
                Text(model.item.light_state)
            }
            HStack {
                Text("Heating:")
                Spacer()
                Text(model.item.heating_state)
            }
            HStack {
                Text("Updated at:")
                Spacer()
                Text(model.item.timestamp)
            }
        }.frame(maxWidth: 300)
    }
    init() {
        model.getData()
    }
}
