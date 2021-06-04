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
    @AppStorage("status") var logged = false
    
    var body: some View {
        GeometryReader { geometry in
            let colWidth = geometry.size.width / 3
            
            if !logged {
                LoginView()
                    .navigationBarHidden(true)
            } else {
                TabView {
                    NavigationView {
                        HomeView(people: people, colWidth: colWidth)
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
