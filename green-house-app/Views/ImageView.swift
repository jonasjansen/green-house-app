import SwiftUI
import FirebaseStorage
import SDWebImageSwiftUI

struct ImageView: View {
    @State private var imageURL = URL(string: "")
    var body: some View {
        VStack{
            WebImage(url: imageURL)
                 .resizable()
                 .aspectRatio(contentMode: .fit)
        }.onAppear(perform: loadImageFromFirebase)
  }
  func loadImageFromFirebase() {
       let storage = Storage.storage().reference(withPath: "greenhouse_snapshot.jpg")
       storage.downloadURL { (url, error) in
           if error != nil {
               print((error?.localizedDescription)!)
               return
       }
       print("Download success")
       self.imageURL = url!
   }
  }
}
