//
//  ControlView.swift
//  green-house-app
//
//  Created by Jonas Jansen on 21.04.23.
//

import SwiftUI
import Firebase

struct ControlView: View {
    @ObservedObject var model = OverrideModel()
    
    var body: some View {
        VStack {
            Text("Light")
            //Spacer()
            HStack {
                Button(action: {
                    // Turn light on
                    model.updateData(documentId: "override_light", status: 1, counter: 1)
                }, label: {
                    Text("On")
                })
                Button(action: {
                    // Turn light off
                    model.updateData(documentId: "override_light", status: 0, counter: 1)
                }, label: {
                    Text("Off")
                })
            }
        }
        VStack {
            Text("Heating")
            //Spacer()
            HStack {
                Button(action: {
                    // Turn heating on
                    model.updateData(documentId: "override_heating", status: 1, counter: 1)
                }, label: {
                    Text("On")
                })
                Button(action: {
                    // Turn heating on
                    model.updateData(documentId: "override_heating", status: 0, counter: 1)
                }, label: {
                    Text("Off")
                })
            }
        }
        VStack {
            Text("Window")
            //Spacer()
            HStack {
                Button(action: {
                    // Open window
                    model.updateData(documentId: "override_window", status: 1, counter: 1)
                }, label: {
                    Text("Open")
                })
                Button(action: {
                    // Close window
                    model.updateData(documentId: "override_window", status: 0, counter: 1)
                }, label: {
                    Text("Close")
                })
            }
        }
    }
}
