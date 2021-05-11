//
//  StoriesView.swift
//  InstaCloneUI
//
//  Created by Esther Huecas on 10/05/2021.
//

import SwiftUI

struct StoriesView: View {
    var people: [Person]
    
    var body: some View {
        ScrollView(.horizontal ) {
            HStack {
                VStack {
                    //My story
                    Image(systemName: "person.crop.circle.badge.plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 65)
                        .rotation3DEffect(
                            .degrees(180),
                            axis: (x: 0, y: 1, z: 0)
                        )
                        .foregroundColor(.gray)
                        .opacity(0.5)
                        .colorInvert()
                    Text("Your story")
                        .font(.system(size: 12))
                }
                .padding(.trailing, 10)
                .padding(.leading, 10)
                
                //People stories
                ForEach(people, id: \.id) { person in
                    VStack {
                        PersonAvatarView(person: person , width: 60, lineWidth: 2 )
                        Text(person.name)
                            .textStylePrimary()
                    }
                    .padding(.trailing, 10)
                }
            }
            .padding(.bottom, 15)
        }
    }
}

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
