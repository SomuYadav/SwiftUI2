//
//  InstaView.swift
//  SMSwiftUI1.0
//
//  Created by Apple on 10/07/20.
//

import SwiftUI

struct InstaView: View {
    
    @State var previousIndex = 0
    @State var selectedIndex = 0
  
    var body: some View {
        TabView(selection: $selectedIndex) {
            ContentView()
                .tabItem {
                    Image(systemName:  selectedIndex == 0 ? "house.fill" : "house")
                        Text("Home")
                }.tag(0)
            
            SearchBar()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }.tag(1)
               
            ImagePickerControlView(selectedIndex: $selectedIndex, previousIndex: self.previousIndex)
                .tabItem {
                    Image(systemName:  selectedIndex == 2 ? "plus.square.fill" : "plus.square")
                        Text("Add")
                            .onTapGesture {
                                self.previousIndex = selectedIndex
                        }
                }.tag(2)

              Love()
                .tabItem {
                        Image(systemName:  selectedIndex == 3 ? "heart.fill" : "heart")
                        Text("Love")
                }.tag(3)
            
            ProfileView()
                .tabItem {
                    Image(systemName:  selectedIndex == 4 ? "person.fill" : "person")
                        Text("Person")
            }.tag(4)
        }
        .accentColor(Color(.label))
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct PlusMenu: View {
    var body: some View {
        HStack(spacing: 50) {
            ZStack {
                Circle()
                    .foregroundColor(Color.blue)
                    .frame(width: 70, height: 70)
                Image(systemName: "camera")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
                    .frame(width: 70, height: 70)
                    .foregroundColor(.white)
            }
            ZStack {
                Circle()
                    .foregroundColor(Color.blue)
                    .frame(width: 70, height: 70)
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
                    .frame(width: 70, height: 70)
                    .foregroundColor(.white)
            }
        }
    }
}

struct InstaView_Previews: PreviewProvider {
    static var previews: some View {
        InstaView()
            .preferredColorScheme(.dark)
    }
}
