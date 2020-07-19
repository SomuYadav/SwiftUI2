//
//  SwiftUI2App.swift
//  Shared
//
//  Created by Apple on 10/07/20.
//

import SwiftUI

@main
struct SwiftUI2App: App {
    var body: some Scene {
        WindowGroup {
            InstaView()
        }
    }
}

struct SplashScreen: View {
    @State private var isActive = false
    let insta = InstaView()

    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Image("images-5")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                      .mask(
                        Text("Insta View")
                            .font(Font.system(size: 180).weight(.heavy))
                    )
//                NavigationLink(destination: insta,
//                               isActive: $isActive,
//                               label: { EmptyView() })
            }
            .background(Color(.black))
            .onAppear(perform: {
                self.gotoLoginScreen(time: 2.5)
            })
            .padding(.all, UIScreen.main.bounds.size.width/10)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    func gotoLoginScreen(time: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(time)) {
            self.isActive = true
        }
    }
}
