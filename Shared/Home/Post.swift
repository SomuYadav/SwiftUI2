//
//  Post.swift
//  SMSwiftUI1.0
//
//  Created by Apple on 10/07/20.
//

import Foundation

struct Post: Identifiable {
    var id: String = UUID().uuidString
    var imageName: String
    var profileImageName: String
    var profileName: String
    var time: String
    var like: Int
    
}

extension Post {
    static var posts = [
        Post(imageName: "images-2", profileImageName: "Profile", profileName: "Somendra Yadav", time: "Palasia chappan dukan,",like: 100),
        Post(imageName: "images-3", profileImageName: "Profile", profileName: "Somendra Yadav", time: "Bhawarkuan,",like: 10),
        Post(imageName: "images-4", profileImageName: "Profile", profileName: "Somendra Yadav", time: "Jisni bada ganapti,",like: 120),
        Post(imageName: "images-5", profileImageName: "Profile", profileName: "Somendra Yadav", time: "Air Port road,",like: 50),
        Post(imageName: "images-6", profileImageName: "Profile", profileName: "Somendra Yadav", time: "Vijay Nagar,",like: 130),
        Post(imageName: "images-7", profileImageName: "Profile", profileName: "Somendra Yadav", time: "Rajiv Gandhi,",like: 125),
        Post(imageName: "images", profileImageName: "Profile", profileName: "Somendra Yadav", time: "SVCE,",like: 155),
        Post(imageName: "images-2", profileImageName: "Profile", profileName: "Somendra Yadav", time: "IIT,",like: 135),
        Post(imageName: "images-3", profileImageName: "Profile", profileName: "Somendra Yadav", time: "IIM,",like: 355),
        Post(imageName: "images-4", profileImageName: "Profile", profileName: "Somendra Yadav", time: "Crecent Blue Water Park,",like: 536)
    ]
}

