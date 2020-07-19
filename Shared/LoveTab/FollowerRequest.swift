//
//  FollowerRequest.swift
//  SwiftUI2 (iOS)
//
//  Created by Apple on 14/07/20.
//

import SwiftUI

struct FollowerRequest: View {
    
    @State var love: LoveModel
    
    var body: some View {
        HStack(spacing: 10) {
            love.profilePic
                .resizable()
                .clipShape(Circle())
                .frame(width: 60, height: 60)
    
            ApnaVStack(spacing: 5, alignment: .leading) {
                Group {
                    Text(love.name ?? "")
                        .font(.headline)
                        .foregroundColor(Color(.label))
                    HStack {
                        Text("Started following you.")
                            .font(.subheadline)
                        Text(love.time)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            Spacer()
            Button(action: {
                if love.follow {
                    self.love.follow = false
                } else {
                    self.love.follow = true
                }
            }, label: {
                if self.love.follow {
                    Text("Follow")
                        .bold()
                        .frame(width: 100, height: 30)
                        .foregroundColor(Color(.label))
                        .border(Color(.label), width: 2)
                        .cornerRadius(5)
                } else {
                    Text("Following")
                        .bold()
                        .frame(width: 100, height: 30)
                        .foregroundColor(Color(.white))
                        .background(Color(#colorLiteral(red: 0, green: 0.6334345341, blue: 1, alpha: 1)))
                        .border(Color(#colorLiteral(red: 0, green: 0.6334345341, blue: 1, alpha: 1)), width: 2)
                        .cornerRadius(5)
                }
                    
                    //.background(View)
//                Text("Follow")
//                    .bold()
//                    .frame(width: 70, height: 30)
//                    .foregroundColor(Color(.label))
//                    .border(Color.gray, width: 2)
//                    .cornerRadius(5.0)
            })
        }
        .padding(.all,0)
    }
}

struct FollowerRequest_Previews: PreviewProvider {
    static var previews: some View {
        FollowerRequest(love: LoveModel(name: "Somendra Yadav", likedBy: "Stuart Broad", follow: true, profilePic: Image("Profile"),time: "5w"))
    }
}
