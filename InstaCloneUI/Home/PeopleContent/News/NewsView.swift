//
//  NewsView.swift
//  InstaCloneUI
//
//  Created by Esther Huecas on 10/05/2021.
//

import SwiftUI

struct NewsView: View {
    var body: some View {
        HStack {
            Image(systemName: "bolt.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20)
                .rotationEffect(.degrees(20))
            
            Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.")
                .textStylePrimary()
            
            Image(systemName: "xmark")
                .myStylePrimary()
                .frame(width: 12)
                .foregroundColor(.gray)
        }
        .padding(.leading, 10)
        .padding(.trailing, 10)
        .padding(.bottom, 15)
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
