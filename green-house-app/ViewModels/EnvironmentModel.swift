//
//  ViewModelEnvironment.swift
//  green-house-app
//
//  Created by Jonas Jansen on 21.04.23.
//

import Foundation
import Firebase
import SwiftUI
import FirebaseStorage
import SDWebImageSwiftUI


class EnvironmentModel: ObservableObject {
    @Published var list = [Environment]()
    @Published var item  = Environment( id:"", heating_state:"", humidity:"", light_state:"", moisture:"", temperature:"", image_path:"")
    //@Published var imageURL = URL(string: "")
    @Published var imageURL = ""
    @Published var imageUrl: URL?
    @Published var image: WebImage?
    
    func getData()
    {
        // Get a reference to the database
        let db = Firestore.firestore()
        db.collection("environment").order(by: "timestamp", descending: true).limit(to: 1)
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(error!)")
                    return
                }
                let d = documents.first
                if let d = d {
                    //self.loadImageFromFirebase(imagePath: String(describing: d["temperature"]))
                    self.loadImage()
                    self.imageURL = d["image_path"] as? String ?? ""
                    self.item =  Environment(
                        id: d.documentID,
                        heating_state: d["heating_state"] as? String ?? "",
                        humidity: d["humidity"] as? String ?? "",
                        light_state: d["light_state"] as? String ?? "",
                        moisture: d["moisture"] as? String ?? "",
                        temperature: d["temperature"] as? String ?? "",
                        image_path: d["image_path"] as? String ?? "")
                }
            }
    }
    func loadImageFromFirebase(imagePath: String) {
         let storage = Storage.storage().reference(withPath: imagePath)
         storage.downloadURL { (url, error) in
             if error != nil {
                 print((error?.localizedDescription)!)
                 return
         }
         print("Download success")
         //self.imageURL = url!
     }
    }
    func loadImage() {
        print("Environment Model - Download start")
        //let storageRef = Storage.storage().reference(withPath: "greenhouse_snapshot.jpg")
        let storage = Storage.storage().reference(withPath: "greenhouse_snapshot.jpg")
        storage.downloadURL { (url, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            print("Environment Model - Download success!")
            print("\(url!)")
            self.image = WebImage(url: url)
            self.imageUrl = URL(string: String(describing:url))
        }
    }
}
