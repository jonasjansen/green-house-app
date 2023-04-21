//
//  ControlView.swift
//  green-house-app
//
//  Created by Jonas Jansen on 21.04.23.
//

import SwiftUI
import Firebase

struct ControlView: View {
    var body: some View {
        VStack {
            Text("Light")
            //Spacer()
            HStack {
                Button(action: {
                    // Turn light on
                }, label: {
                    Text("On")
                })
                Button(action: {
                    // Turn light on
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
                }, label: {
                    Text("On")
                })
                Button(action: {
                    // Turn heating on
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
                    // Turn heating on
                }, label: {
                    Text("Open")
                })
                Button(action: {
                    // Turn heating on
                }, label: {
                    Text("Close")
                })
            }
        }
    }
}
