//
//  ProfileNameStack.swift
//  SwiftUI2 (iOS)
//
//  Created by Apple on 13/07/20.
//

import SwiftUI

struct ProfileNameStack: View {
    var body: some View {
        HStack(spacing: 30) {
            Image("Profile")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .scaledToFit()
            VStack(alignment: .leading,spacing: 10) {
                Text("yadav.somendra")
                    .font(.title)
                    .foregroundColor(Color(.label))
                Button(action: {
                    
                }, label: {
                    Text("Edit Profile")
                        .bold()
                        .foregroundColor(Color(.label))
                })
                .frame(width: 250, height: 30)
                .border(Color.init(.darkGray), width: 1.8)
                .cornerRadius(5)
            }
        }
    }
}

struct ProfileDescBox: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 20) {
            ProfileNameStack()
            
            VStack(alignment: .leading,spacing: 10) {
                Text("Somendra Yadav")
                    .font(.headline)
                    .bold()
                    .multilineTextAlignment(.leading)
                
                Text("# iOS Engineer #\n# Cricket and Music Lover #\n# Wish me on 20 oct #\n# Life: A State of Electron #")
                    .lineSpacing(5)
                    .multilineTextAlignment(.leading)
                    .font(.subheadline)
            }
        }
        .padding(.bottom, 20)
    }
}

struct ProfileNameStack_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDescBox()
    }
}
