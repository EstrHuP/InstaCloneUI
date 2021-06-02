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
            PersonAvatarView(person: people, width: 30, lineWidth: 2)
            VStack(alignment: .leading) {
                Text(people.name)
                    .textStylePrimary()
                Text("TextMusic - Original Audio")
                    .textStyleSecondary()
            }
            
            Spacer()
            
            Image(systemName: "ellipsis")
                .myStylePrimary()
                .frame(width: 15)
                .padding(.trailing, 10)
        }
        .padding(.leading, 10)
        .padding(.trailing, 10)
    }
}

