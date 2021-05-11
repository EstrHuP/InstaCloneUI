//
//  PeopleContentView.swift
//  InstaCloneUI
//
//  Created by Esther Huecas on 10/05/2021.
//

import SwiftUI

struct PersonHeaderPost: View {
    var people: Person
    
    var body: some View {
        HStack {
            Image(people.avatar)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30)
                .padding(2)
                .clipShape(Circle())
                .overlay(Circle()
                            .stroke(Color.black,
                                    lineWidth: 2))
            VStack(alignment: .leading) {
                Text(people.name)
                    .font(.system(size: 12))
                Text("TextMusic - Original Audio")
                    .font(.system(size: 12))
            }
            
            Spacer()
            
            Image(systemName: "ellipsis")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 15)
                .padding(.trailing, 10)
        }
    }
}

