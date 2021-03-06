//
//  PersonNavBottomView.swift
//  InstaCloneUI
//
//  Created by Esther Huecas on 10/05/2021.
//

import SwiftUI

struct FooterBarPostView: View {
    var colWidth: CGFloat
    
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.fixed(colWidth), alignment: .leading),
            GridItem(.fixed(colWidth)),
            GridItem(.fixed(colWidth), alignment: .trailing)
        ]) {
            HStack(spacing: 10) {
                Image(systemName: "heart")
                    .myStylePrimary()
                    .frame(width: 20)
                    .padding(.top, -8)
                    .foregroundColor(.gray)
                Image(systemName: "message")
                    .myStylePrimary()
                    .frame(width: 20)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0, y: 1, z: 0)
                    )
                    .padding(.top, -8)
                    .foregroundColor(.gray)
                Image(systemName: "paperplane")
                    .myStylePrimary()
                    .frame(width: 20)
                    .rotationEffect(.degrees(12))
                    .padding(.top, -8)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            Image(systemName: "bookmark")
                .myStylePrimary()
                .frame(width: 15)
                .foregroundColor(.gray)
                .padding(.trailing, 40)
                .padding(.top, -8)
        }
//        .padding(.leading, 100)
//        .padding(.trailing, 100)
    }
}
