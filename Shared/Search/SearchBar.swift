//
//  SearchBar.swift
//  SwiftUI2
//
//  Created by Apple on 12/07/20.
//

import SwiftUI
import AVFoundation
import AVKit

struct ImgItem:Identifiable {
    var id: UUID = UUID()
    var img:  String
}

struct VideoView: UIViewRepresentable {
    
    var videoURL:URL
    var previewLength:Double?
    
    func makeUIView(context: Context) -> UIView {
        return PlayerView(frame: .zero, url: videoURL, previewLength: previewLength ?? 15)
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

struct SearchBar: View {
    
    var items = [
                     ImgItem(img:"images-2"),
                     ImgItem(img:"images-3"),
                     ImgItem(img:"images"),
                     ImgItem(img:"images-5"),
                     ImgItem(img:"images-6"),
                     ImgItem(img:"images-7"),
                     ImgItem(img:"images-2"),
                     ImgItem(img:"images-3"),
                     ImgItem(img:"images-4"),
                     ImgItem(img:"images-5"),
                     ImgItem(img:"images-6"),
                     ImgItem(img:"images-7"),
                     ImgItem(img:"images-2"),
                     ImgItem(img:"images-3"),
                     ImgItem(img:"images-4"),
                     ImgItem(img:"images-5"),
                     ImgItem(img:"images-6"),
                     ImgItem(img:"images-7"),
                     ImgItem(img:"images"),
                     ImgItem(img:"images-2"),
                     ImgItem(img:"images-7")
    ]
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    let url = Bundle.main.url(forResource: "flower", withExtension: "mov")
    var body: some View {

        NavigationView {
            VStack {
                // Search view
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")

                        TextField("search", text: $searchText, onEditingChanged: { isEditing in
                            self.showCancelButton = true
                        }, onCommit: {
                            print("onCommit")
                        }).foregroundColor(.primary)

                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                        }
                    }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10.0)

                    if showCancelButton  {
                        Button("Cancel") {
                                UIApplication.shared.endEditing(true)
                                // this must be placed before the other commands here
                                self.searchText = ""
                                self.showCancelButton = false
                        }
                        .foregroundColor(Color(.systemBlue))
                    }
                }
                .padding(.horizontal)
                .navigationBarHidden(showCancelButton)

                //List {
//                    // Filtered list of names
//                    ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {
//                        searchText in Text(searchText)
//                    }
                //}
                let gridItemLayout = [
                    GridItem(spacing: 0),
                    GridItem(spacing: 0),
                    GridItem(spacing: 0)
                ]
                
            ScrollView(.vertical) {
                HStack(spacing: 0) {
                    VStack(spacing: 0) {
                        Image("images-2")
                           .resizable()
                           .aspectRatio(1,contentMode: .fill)
                        Image("images-4")
                           .resizable()
                           .aspectRatio(1,contentMode: .fill)
                    }
        
                    HStack(spacing: 0) {
                        VideoView(videoURL: url!,
                                  previewLength: 60)

//                        VideoPlayer(player: AVPlayer(url:  URL(string: "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_1MB.mp4")!))
////                        Image("Profile")
//                           //.resizable()
                           .frame(minWidth: 280, maxWidth: .infinity,minHeight: 100)
                            .overlay(
                                VStack(alignment: .leading,spacing: 5) {
                                    Text("Watch")
                                            .font(.subheadline)
                                            .foregroundColor(.white)
                                    Text("Videos You Might Like")
                                           .font(.title3)
                                           .bold()
                                           .foregroundColor(.white)
                                    
                            }
                                .padding(.leading, 10)
                                .padding(.bottom, 10)
                        ,alignment: .bottomLeading)
                    }
                }
                .padding(.bottom,0)

                LazyVGrid(columns: gridItemLayout, alignment: .center,spacing: 0) {
                    ForEach(0..<items.count) { index in
                        Image(items[index].img)
                            .resizable()
                            .aspectRatio(1,contentMode: .fill)
                      }
                   }
                .padding(.top,-8)
              }
        
                .navigationBarTitle(Text("Search"))
                .resignKeyboardOnDragGesture()
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchBar()
              .environment(\.colorScheme, .light)

            SearchBar()
              .environment(\.colorScheme, .dark)
        }
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
