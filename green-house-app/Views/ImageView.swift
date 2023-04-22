import SwiftUI
import FirebaseStorage
import SDWebImageSwiftUI

class ImageObservable: ObservableObject {
    @Published var imageURL = URL(string: "")
    
    func loadImage(imageName: String) {
        let storage = Storage.storage().reference(withPath: imageName)
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


struct ImageView: View {
    @ObservedObject var model = EnvironmentModel()
    @StateObject var image = ImageObservable()
    
    var body: some View {
        VStack{
            ImageInnerView(image: self.image, model: self.model)
            Text("Image url: \(URL(string: model.item.image_path)?.absoluteString ?? "placeholderOuter2")")
            WebImage(url: self.image.imageURL)
                 .resizable()
                 .aspectRatio(contentMode: .fit)
        .onAppear(perform: loadImageFromFirebase)
        }
    }
    init() {
        self.model.getData()
        self.image.imageURL = URL(string: model.item.image_path)
    }
    func loadImageFromFirebase() {
         let storage = Storage.storage().reference(withPath: "greenhouse_snapshot.jpg")
        storage.downloadURL { (url, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            print("Download success")
            self.image.imageURL = url!
        }
    }
}

struct ImageInnerView: View {
    @ObservedObject var image: ImageObservable
    @ObservedObject var model = EnvironmentModel()

    var body: some View {
        Text("Image url2: \(URL(string: model.item.image_path)?.absoluteString ?? "placeholderOuter2")")
        Button("Reload Image") {
            self.image.loadImage(imageName: model.item.image_path)
            print("DEBUG: \(model.item.image_path) ")
        }
    }
}
