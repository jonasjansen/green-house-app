import SwiftUI
import FirebaseStorage
import SDWebImageSwiftUI

struct WebImageOuterView: View {
    @ObservedObject var model = EnvironmentModel()
    @State var imageURL = URL(string: "")
    
    
    var body: some View {
        Text("Outer")
        Text("\(model.item.image_path)")
        //Text("\( imageURL?.absoluteString)")
        Text("\(imageURL?.absoluteString ?? "placeholderOuter1")")
        //THIS WORKS
        Text("\(URL(string: model.item.image_path)?.absoluteString ?? "placeholderOuter2")")
        //WebImageInnerView(imageURL: "https://test.com")
        WebImageInnerView(
            imagePath: "https://test.com",
            imagePathReload: "\(model.item.image_path)",
            imageURL: URL(string: "https://abc.com"),
            imageURLReload: URL(string: model.item.image_path)
        )
    }
    init() {
        model.getData()
        imageURL = URL(string: model.item.image_path)
    }
}

struct WebImageInnerView: View {
    
    //@State var imageURL = URL(string: "")
    @State var imagePath = ""
    @State var imagePathReload = ""
    @State var imageURL = URL(string: "")
    @State var imageURLReload = URL(string: "")
    //@State private var imageURL = URL(string: "")
    
    var body: some View {
        VStack{
            Text("Inner")
            //Text("\(imageURL?.absoluteString ?? "placeholder")")
            Text(imagePath)
            Text("\(imagePathReload)")
            Text("\(imageURL?.absoluteString ?? "placeholderInner1")")
            Text("\(imageURLReload?.absoluteString ?? "placeholderInner2")")
        }
    }
}


struct WebImageTestView: View {
    @ObservedObject var model = EnvironmentModel()
    @State var imageURL = URL(string: "")
    
    var body: some View {
        VStack{
            Text("\(model.item.image_path)")
            //THIS WORKS
            Text("\(URL(string: model.item.image_path)?.absoluteString ?? "Placeholder WebImageTestView")")
            WebImage(url: self.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }.onAppear(perform: loadImageFromFirebase)
    }
    init() {
        //print("DOWNLOAD - TEST")
        model.getData()
        self.loadImageFromFirebase()
        //print("DOWNLOAD - IMAGE PATH \(model.item.image_path)")
        //loadImageFromFirebase(String(describing: model.item.image_path))
        //loadImageFromFirebase(imagePath: "greenhouse_snapshot.jpg")
        
    }
    func loadImageFromFirebase() {
        model.getData()
        print("START DOWNLOAD")
        print("\(model.item.image_path)")
        print("\(URL(string: model.item.image_path)?.absoluteString ?? "Placeholder WebImageTestView")")
        
            let storage = Storage.storage().reference(withPath: "greenhouse_snapshot.jpg")
         storage.downloadURL { (url, error) in
             if error != nil {
                 print((error?.localizedDescription)!)
                 return
             }
             print("Download success!")
             print("\(url!)")
             self.imageURL = url!
         }
    }
}

struct ImagetTestv2View: View {
    var imageView = UIImageView()
    
    var body: some View {
        Text("TEST")
        
    }
    init() {
        let storageRef = Storage.storage().reference(withPath: "greenhouse_snapshot.jpg")
        
        // Reference to an image file in Firebase Storage
        let reference = storageRef.child("images/stars.jpg")

        // UIImageView in your ViewController
        let imageView: UIImageView = self.imageView

        // Placeholder image
        let placeholderImage = UIImage(named: "placeholder.jpg")

        // Load the image using SDWebImage
        //imageView.sd_setImage(with: reference, placeholderImage: placeholderImage)
    }
}




struct TestContentView: View {
    @State var imageName = ""
    @State private var image: WebImage?

    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }

    func loadImage() {
        //let storageRef = Storage.storage().reference(withPath: "greenhouse_snapshot.jpg")
        let storage = Storage.storage().reference(withPath: "greenhouse_snapshot.jpg")
        storage.downloadURL { (url, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            print("Download success!")
            print("\(url!)")
            self.image = WebImage(url: url)
        }
        //image = storageRef.child("images/stars.jpg")
    }
}
