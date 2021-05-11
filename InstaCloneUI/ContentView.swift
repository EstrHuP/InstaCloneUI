//
//  ContentView.swift
//  InstaCloneUI
//
//  Created by Esther Huecas on 10/05/2021.
//

import SwiftUI

struct ContentView: View {
    let people: [Person] = [
        Person(name: "melenasa", avatar: "avatar-boy-long-hair", imagePost: "post-pokemon"),
        Person(name: "marijoze", avatar: "avatar-girl", imagePost: "post-covid"),
        Person(name: "peasoBarba", avatar: "avatar-boy-beard", imagePost: "post-oliver")
    ]
    
    var body: some View {
        GeometryReader { geometry in
            let colWidth = geometry.size.width / 3
            
            TabView {
                NavigationView {
                    VStack {
                        //Nav (top)
                        NavView(colWidth: colWidth)
                            .padding(.bottom, 15)
                        
                        ScrollView {
                            VStack(alignment: .leading) {
                                //News
                                NewsView()
                                
                                //Stories
                                StoriesView(people: people)
                                 
                                //Posts
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
                    }
                    //Hide default navigationBar
                    .navigationBarHidden(true)
                }
                .tabItem {
                    Label(
                        title: { Text("Home") },
                        icon: { Image(systemName: "house.fill") }
                    )
                }
                NavigationView {
                    VStack {
                        
                    }
                }
                
                .tabItem {
                    Label(
                        title: { Text("Search") },
                        icon: { Image(systemName: "magnifyingglass") }
                    )
                }
                NavigationView {
                    VStack {
                        
                    }
                }
                
                .tabItem {
                    Label(
                        title: { Text("Reels") },
                        icon: { Image(systemName: "video.bubble.left") }
                    )
                }
                NavigationView {
                    VStack {
                        
                    }
                }
                
                .tabItem {
                    Label(
                        title: { Text("Likes") },
                        icon: { Image(systemName: "heart") }
                    )
                }
                NavigationView {
                    VStack {
                        
                    }
                }
                
                .tabItem {
                    Label(
                        title: { Text("Me") },
                        icon: { Image(systemName: "person") }
                    )
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
