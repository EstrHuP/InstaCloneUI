//
//  PersonAvatarView.swift
//  InstaCloneUI
//
//  Created by Esther Huecas on 31/05/2021.
//

import SwiftUI

struct PersonAvatarView: View {
    var person: Person
    var width: CGFloat
    var lineWidth: CGFloat
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: width + 7, height: width + 7)
                .background(Color("PrimaryColor"))
                .clipShape(Circle())
            
            Image(person.avatar)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width)
                .clipShape(Circle())
                .overlay(Circle()
                            .stroke(Color("PrimaryColorInvert" ), lineWidth: lineWidth)
                )
        }
    }
}
