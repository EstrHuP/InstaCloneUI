//
//  NavView.swift
//  InstaCloneUI
//
//  Created by Esther Huecas on 10/05/2021.
//

import SwiftUI

struct NavView: View {
    var colWidth: CGFloat
    
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.fixed(colWidth)),
            GridItem(.fixed(colWidth)),
            GridItem(.fixed(colWidth), alignment: .trailing)
        ]) {
            Spacer()
            Text("InstaCloneUI")
                .font(.custom("Helvetica Neue", size: 20))
                .fontWeight(.bold)
//            Image(systemName: "plus.square")
            Image(systemName: "paperplane")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 12)
                .rotationEffect(.degrees(12))
                .padding(.trailing, 20)
        }
    }
}
