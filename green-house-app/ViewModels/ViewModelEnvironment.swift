//
//  ViewModelEnvironment.swift
//  green-house-app
//
//  Created by Jonas Jansen on 21.04.23.
//

import Foundation
import Firebase

class ViewModelEnvironment: ObservableObject {
    @Published var list = [Environment]()
    
    
    func getData() {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Read the documents at a specific path
        //let environmentRef = db.collection("environment")
        //environmentRef.order(by: "timestamp")
        db.collection("environment").getDocuments { snapshot, error in
            
            // Check for errors
            if error == nil {
                // No errors
                
                if let snapshot = snapshot {
                    
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        self.list = snapshot.documents.map { d in
                            
                            return Environment(
                                id: d.documentID,
                                heating_state: d["heating_state"] as? String ?? "",
                                humidity: d["humidity"] as? String ?? "",
                                light_state: d["light_state"] as? String ?? "",
                                moisture: d["moisture"] as? String ?? "",
                                temperature: d["temperature"] as? String ?? "",
                                timestamp: d["timestamp"] as? String ?? "")
                        }
                    }
                }
            }
            else {
                // Handle the error
            }
        }
    }
}
