//
//  SectionViews.swift
//  SwiftUI2 (iOS)
//
//  Created by Apple on 14/07/20.
//

import SwiftUI

struct SectionGrid: View {
    
    var items: [ImgItem]
    
    var gridLayOut = [
        GridItem(spacing: 0),
        GridItem(spacing: 0),
        GridItem(spacing: 0),
    ]
        
    var body: some View {
        LazyVGrid(columns: gridLayOut,spacing: 0) {
            ForEach(items) { item in
                Image(item.img)
                    .resizable()
                    .aspectRatio(1,contentMode: .fill)
            }
        }
        .padding(.top, -8)
    }
}

struct Section0: View {
    
    var items = [
                     ImgItem(img:"images-2"),
                     ImgItem(img:"images-3"),
                     ImgItem(img:"images-4"),
                     ImgItem(img:"images-5"),
                     ImgItem(img:"images-6"),
                     ImgItem(img:"images-7"),
                     ImgItem(img:"images-2"),
                     ImgItem(img:"images-3"),
                     ImgItem(img:"images-4"),
                     ImgItem(img:"images-5")
    ]
    
    
    var body: some View {
        SectionGrid(items: items)
    }
}

struct Section1: View {
    var items = [
                    
                     ImgItem(img:"images-7"),
                     ImgItem(img:"images-5"),
                     ImgItem(img:"images-6"),
                     ImgItem(img:"images-4"),
                     ImgItem(img:"images-2"),
                     ImgItem(img:"images-3"),
                     ImgItem(img:"images-4"),
                     ImgItem(img:"images-5"),
                     ImgItem(img:"images"),
    ]
    
    var body: some View {
        SectionGrid(items: items)
    }
}

struct SectionViews_Previews: PreviewProvider {
    static var previews: some View {
        Section0()
    }
}
