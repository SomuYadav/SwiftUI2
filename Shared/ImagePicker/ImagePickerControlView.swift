//
//  ImagePickerControlView.swift
//  SwiftUI2 (iOS)
//
//  Created by Apple on 15/07/20.
//

import SwiftUI

struct ImagePickerControlView: View {
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @Binding var selectedIndex: Int
    var previousIndex: Int
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        let image = Image(uiImage: inputImage)
        selectedIndex = previousIndex
    }
    
    var body: some View {
        NavigationView {
            GroupBox(label: Text("Tap to select image")) {
                Image(uiImage: inputImage ?? #imageLiteral(resourceName: "images-4"))
                    .resizable()
                    .onTapGesture {
                        showingImagePicker = true
                }
            }
            .frame(width: 300, height: 300)
        }
        .navigationTitle("Gallery")
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
    }
}

//struct ImagePickerControlView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImagePickerControlView(isSelectedIndex: )
//    }
//}
//Image("images-5")
//    .resizable()
//    .aspectRatio(contentMode: .fit)
//      .mask(
//        Text("Tap to select image")
//            .font(Font.system(size: 30).weight(.heavy))
//    )
