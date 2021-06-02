//
//  HomeView.swift
//  InstaCloneUI
//
//  Created by Esther Huecas on 02/06/2021.
//

import SwiftUI

struct HomeView: View {
    var people: [Person]
    var colWidth: CGFloat
    
    var body: some View {
        VStack {
        //Nav (top)
        NavView(colWidth: colWidth)
            .padding(.bottom, 15)
        
        ScrollView.init(.vertical, showsIndicators: false, content: {
            VStack(alignment: .leading) {
                //News
                NewsView()
                
                //Stories
                StoriesView(people: people)
                 
                //Posts
                ContentPostView(people: people, colWidth: colWidth)
            }
        })
    }
    //Hide default navigationBar
    .navigationBarHidden(true)
    }
}
