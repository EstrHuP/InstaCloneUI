//
//  ContentPostView.swift
//  InstaCloneUI
//
//  Created by Esther Huecas on 11/05/2021.
//

import SwiftUI

struct ContentPostView: View {
    var people: [Person]
    var colWidth: CGFloat
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            ForEach(people, id: \.id) { person in
                PersonHeaderPost(people: person)
                
                Image(person.imagePost)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.bottom, 5)
                
                
                PersonFooterPost(person: person, colWidth: colWidth)
            }
        }
    }
}
