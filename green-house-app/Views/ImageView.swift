import SwiftUI
import FirebaseStorage
import SDWebImageSwiftUI

struct ImageView: View {
    @ObservedObject var model = EnvironmentModel()
    //@ObservedObject var imagePath = ""
    @State var imageURL = URL(string: "")
    /*public struct Song: Identifiable, Codable, Hashable {
       public var id: String = UUID().uuidString
       var image: String
       var title: String
       var author: String
       var track: String
    }
     */
    //@State private var song = Song(image: "String", title: "String", author: "String", track: "String")
    //@State private var song = Song(image: "String", title: "String", author: "String", track: "String")

    
    
    var body: some View {
        VStack{
            //WebImage(url: URL(string: model.imageUrl))
            //WebImage(url: URL(string: song.image)).id(song.id)
            //WebImage(url: URL(string: model.imageUrl))
            WebImage(url: self.imageURL)
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
