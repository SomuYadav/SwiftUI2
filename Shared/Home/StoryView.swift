//
//  StoryView.swift
//  SMSwiftUI1.0
//
//  Created by Apple on 10/07/20.
//

import Foundation
import SwiftUI

struct StoryView: View {
    @State var isImagePickerPresented = false
    @State var pickedImage: Image? = nil
    @State private var inputImage: UIImage?
    
    let index: Int
    
    var body: some View {
        VStack {
            if index == 0 {
                Button(action: {
                    isImagePickerPresented = true
                }, label: {
                    (self.pickedImage ??  Image("Profile"))
                        //Image.postImages[index].0
                        .frame(width: 80, height: 80)
                        .overlay(
                            LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                .mask(
                                    
                                Circle()
                                   .inset(by: 2.0)
                                   .stroke(Color.white, lineWidth: 4.0)
                                   .animation(.easeIn)
                            )
                        )
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                })
                .buttonStyle(AddButonStyle())
            } else {
                Image.postImages[index].0
                    .frame(width: 80, height: 80)
                    .overlay(
        
                        LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            .mask(
                                
                            Circle()
                               .inset(by: 2.0)
                               .stroke(Color.white, lineWidth: 4.0)
                               .animation(.easeIn)
                        )
                    )
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            }
            
            Text("\(Image.postImages[index].1)")
                .font(.caption)
                .lineLimit(1)
                .frame(width: 80)
        }
        .sheet(isPresented: $isImagePickerPresented, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        self.pickedImage = Image(uiImage: inputImage) 
    }
}
