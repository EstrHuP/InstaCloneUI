//
//  PersonNavBottomView.swift
//  InstaCloneUI
//
//  Created by Esther Huecas on 10/05/2021.
//

import SwiftUI

struct PersonNavBottomView: View {
    var colWidth: CGFloat
    
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.fixed(colWidth), alignment: .leading),
            GridItem(.fixed(colWidth)),
            GridItem(.fixed(colWidth), alignment: .trailing)
        ]) {
            HStack {
                Image(systemName: "heart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .padding(.top, -8)
                    .foregroundColor(.gray)
                Image(systemName: "message")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0, y: 1, z: 0)
                    )
                    .padding(.top, -8)
                    .foregroundColor(.gray)
                Image(systemName: "paperplane")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20)
                    .rotationEffect(.degrees(12))
                    .padding(.top, -8)
                    .foregroundColor(.gray)
                
            }
            Spacer()
            
            Image(systemName: "bookmark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 15)
                .padding(.trailing, 10)
                .foregroundColor(.gray)
                .padding(.trailing, 30)
        }
        .padding(.leading, 10)
        .padding(.trailing, 10)
        .padding(.bottom, 15)
    }
}
