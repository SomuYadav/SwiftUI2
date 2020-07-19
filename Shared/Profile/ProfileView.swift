//
//  ProfileView.swift
//  SwiftUI2 (iOS)
//
//  Created by Apple on 13/07/20.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView() {
            ProfileDescBox()
            TOOLBarView()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
