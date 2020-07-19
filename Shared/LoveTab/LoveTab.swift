//
//  Love.swift
//  SwiftUI2 (iOS)
//
//  Created by Apple on 14/07/20.
//

import SwiftUI

struct HeaderLove: View {
    @Binding var selectedSegment: Int
    var segementSection = ["Following", "You"]
    
    var body: some View {
        VStack {
            Picker("", selection: $selectedSegment,content: {
                ForEach(0..<segementSection.count) { index in
                    Text("\(segementSection[index])")
                }
            })
            .padding(.bottom, 10)
    
            HStack(spacing: 20) {
                Image(systemName: "person.crop.circle.badge.plus")
                    .resizable()
                    .frame(width: 45, height: 40)
                    .scaledToFit()
                    //.clipShape(Circle())
                    .foregroundColor(Color(.label))
    //                    .padding(.trailing, 20)
                ApnaVStack(spacing: 5,alignment: .leading) {
                    Group {
                        Text("Follow Requests")
                            .bold()
                        Text("Approve or ignore requests")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                Spacer()
                Image(systemName: "arrow.right.circle.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .scaledToFit()
                    //.clipShape(Circle())
                    .foregroundColor(Color(.label))
                    .padding(.trailing, 10)
            }
            .padding(.leading,15)
            .padding(.top,10)
            .padding(.bottom,10)
            .padding(.trailing,10)
            .border(Color.init(.systemGray), width: 1)
        }.pickerStyle(SegmentedPickerStyle())
        .padding(.leading, -5)
        .padding(.trailing, -5)
    }
}

struct ListLove: View {
    @State var selectedSegment = 0
    
    var arrLove = [
        LoveModel(name: "Somendra_Yadav223", likedBy: "Stuart Broad", follow: true, profilePic: Image("Profile"),time: "5w"),
        LoveModel(name: "paul_656", likedBy: "Somendra yadav", follow: true, profilePic: Image("Profile"),time: "5w"),
        LoveModel(name: "garim_878", likedBy: "Stuart Broad", follow: true, profilePic: Image("Profile"),time: "2 days ago"),
        LoveModel(name: "nirah_25", likedBy: "paul hudson", follow: true, profilePic: Image("Profile"),time: "2w"),
        LoveModel(name: "lauri_66", likedBy: "Stuart Broad", follow: true, profilePic: Image("Profile"),time: "1h"),
        LoveModel(name: "pk_007", likedBy: "lauri famen", follow: true, profilePic: Image("Profile"),time: "10 min ago"),
        LoveModel(name: "Notek_88", likedBy: "pk mourya", follow: true, profilePic: Image("Profile"),time: "1m"),
        LoveModel(name: "bad_boy_989", likedBy: "kim bro", follow: true, profilePic: Image("Profile"),time: "3w"),
        LoveModel(name: "somendra_877", likedBy: "donald_hudson", follow: true, profilePic: Image("Profile"),time: "34 hours ago")
    ]
    
    var body: some View {
        
        VStack(spacing: 0){
            HeaderLove(selectedSegment: $selectedSegment)
            GroupBox {
                List {
                    switch selectedSegment {
                       case 0:
                        ForEach(0..<self.arrLove.count) { index in
                            FollowerRequest(love: self.arrLove[index])
                        }
                       case 1:
                        ForEach(0..<self.arrLove.count-5) { index in
                            FollowerRequest(love: self.arrLove[index])
                        }
                       
                      default:
                            Text("nkknnknknkn")
                    }
                }
                .cornerRadius(10)
            }
        }
    }
}

struct Love: View {
    var body: some View {
        NavigationView {
            ListLove()
            .navigationTitle("Activity")
        }
    }
}

struct Love_Previews: PreviewProvider {
    static var previews: some View {
        Love()
            .preferredColorScheme(.dark)
    }
}
