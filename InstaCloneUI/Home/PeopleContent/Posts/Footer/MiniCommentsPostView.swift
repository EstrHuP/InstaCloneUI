//
//  Comments.swift
//  InstaCloneUI
//
//  Created by Esther Huecas on 11/05/2021.
//

import SwiftUI

struct MiniCommentsPostView: View {
    var person: Person
    @State var commentTxt: String = ""
    
    var body: some View {
        HStack(spacing: 5) {
            PersonAvatarView(person: person, width: 15, lineWidth: 2)
            
            TextField("Add comment", text: $commentTxt)
                .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(Color("PrimaryColor"), lineWidth: 0.2))
            Text("👩🏻‍💻")
            Text("🤡")
            
            Image(systemName: "plus.circle")
                .myStyleTertiary()
                .frame(width: 15)
                .padding(.trailing, 60)
        }
    }
}
