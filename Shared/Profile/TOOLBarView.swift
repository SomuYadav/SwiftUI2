//
//  TOOLBarView.swift
//  SwiftUI2 (iOS)
//
//  Created by Apple on 13/07/20.
//

import SwiftUI

struct ToolView: View {
    @Binding var selectedIndex: Int
    
    var body: some View {
        VStack(spacing: 0) {
        HStack {
            Spacer(minLength: 10)
            VStack {
                Text("3")
                    .foregroundColor(Color(.label))
                    .bold()
                Text("posts")
                    .foregroundColor(Color(.lightGray))
            }
            Spacer()
            VStack {
                Text("110")
                    .foregroundColor(Color(.label))
                    .bold()
                Text("following")
                    .foregroundColor(Color(.lightGray))
            }
            Spacer()
            VStack {
                Text("136")
                    .foregroundColor(Color(.label))
                    .bold()
                Text("followers")
                    .foregroundColor(Color(.lightGray))
            }
            Spacer(minLength: 10)
        }
        .padding(.top, 10)
        .padding(.bottom, 10)
        .border(Color.gray)
        .padding(.leading, -10)
        .padding(.trailing, -10)
        
        HStack {
            Spacer(minLength: 30)
            Button(action: {
                selectedIndex = 0
            }, label: {
                Image(systemName: "rectangle.split.3x3")
            })
            .foregroundColor(selectedIndex == 0 ? .accentColor: .secondary)
            Spacer()
            Button(action: {
                selectedIndex = 1
            }, label: {
                Image(systemName: "rectangle.grid.1x2")
            })
            .foregroundColor(selectedIndex == 1 ? .accentColor: .secondary)
            Spacer()
            Button(action: {
                selectedIndex = 2
            }, label: {
                Image(systemName: "bookmark")
                    
            })
            .foregroundColor(selectedIndex == 2 ? .accentColor: .secondary)
            Spacer()
            Button(action: {
                selectedIndex = 3
            }, label: {
                Image(systemName: "person.crop.square")
            })
            .foregroundColor(selectedIndex == 3 ? .accentColor: .secondary)
            Spacer(minLength: 30)
        }
        .padding(.top, 15)
        .padding(.bottom, 15)
        .buttonStyle(PlainButtonStyle())
        .font(.title2)
       }
    }
}

struct TOOLBarView: View {
    
    @State var selectedIndex = 0
    @ViewBuilder var content: some View {
        switch selectedIndex {
        case 0:
            Section0()
        case 1:
            ScrollView {
                LazyVStack(spacing: 40) {
                    ForEach(Post.posts) { post in
                        PostView(post: post)
                    }
                }
                .padding(.vertical)
            }
        case 2:
            Section0()
        case 3:
            Section1()
        default:
            EmptyView()
        }
    }
    
    var body: some View {
        VStack {
            ToolView(selectedIndex: $selectedIndex)
            content
        }
    }
}

struct TOOLBarView_Previews: PreviewProvider {
    static var previews: some View {
        TOOLBarView()
    }
}

