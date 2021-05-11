//
//  PersonFooterPost.swift
//  InstaCloneUI
//
//  Created by Esther Huecas on 11/05/2021.
//

import SwiftUI

struct PersonFooterPost: View {
    var person: Person
    var colWidth: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            FooterBarPostView(colWidth: colWidth)
            
            Text("23 likes")
                .textStylePrimary()
            HStack {
                HStack {
                    Text("superkk")
                        .textStylePrimary()
                    Text("hellow")
                        .textStyleSecondary()
                }
                Spacer()
                Image(systemName: "heart")
                    .myStyleSecondary()
                    .frame(width: 10)
                    .padding(.trailing, 60)
            }
            
            Text("View all 3 comments")
                .textStyleTertiary()
                .padding(.bottom, 3)
            
            MiniCommentsPostView(person: person)
            
            Text("12 minutes ago")
                .textStyleTertiary()
                .padding(.bottom, 5)
        }
        .padding(.leading, 10)
        .padding(.trailing, 10)
    }
}
