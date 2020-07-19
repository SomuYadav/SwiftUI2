//
//  PostView.swift
//  SMSwiftUI1.0
//
//  Created by Apple on 10/07/20.
//

import SwiftUI

struct PostView: View {
    
    @State var isLiked    = false
    @State var isBookMark = false
    @State var post: Post
    
    func setHCSBStack() -> some View {
        HStack(spacing: 10) {
            
            Button(action: {
                isLiked.toggle()
                self.isLiked ? (self.post.like += 1) : (self.post.like -= 1)
            }, label: {
                if isLiked {
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.red)
                        .transition(.scale)
                } else {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .transition(.scale)
                }
            })
            .padding(.horizontal,8)
            
            Button(action: {
               
            }, label: {
                Image(systemName: "message")
                    .resizable()
                    .frame(width: 25, height: 25)
            })
            .padding(.horizontal,8)
            
            Button(action: {
               
            }, label: {
                Image(systemName: "arrow.turn.up.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
            })
            .padding(.horizontal,8)
        
            Spacer()
            
            Button(action: {
                isBookMark.toggle()
            }, label: {
                if isBookMark {
                    Image(systemName: "bookmark.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .transition(.scale)
                } else {
                    Image(systemName: "bookmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .transition(.scale)
                }
            })
            .padding(.horizontal,8)
        }
    }
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 20) {
                Image(post.profileImageName)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
//                    .padding(.trailing, 20)
                ApnaVStack(spacing: 5,alignment: .leading) {
                    Group {
                        Text(post.profileName)
                            .bold()
                        Text("\(post.time) Indore")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            
            Image(post.imageName)
                .resizable()
                //.cornerRadius(10.0)
                .aspectRatio(1.3,contentMode: .fit)
        
            self.setHCSBStack()
            .foregroundColor(Color(.label))
            .padding(.horizontal)
            .animation(.default)
            
            HStack(spacing: 20) {
                ApnaVStack(spacing: 5,alignment: .leading) {
                    Group {
                        Text("\(post.like) Likes")
                            .bold()
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post.posts.first!)
    }
}

struct ApnaVStack<Content:View>: View {
   
    let spacing: CGFloat
    let alignment: HorizontalAlignment
    let view: Content
    
    init(spacing: CGFloat = 8.0, alignment: HorizontalAlignment = .center,@ViewBuilder _ builder: ()->Content) {
        self.spacing = spacing
        self.alignment = alignment
        self.view = builder()
    }
    
    var body: some View {
        VStack(alignment: alignment,spacing: spacing) {
            view
        }
    }
}
