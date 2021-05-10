//
//  Person.swift
//  InstaCloneUI
//
//  Created by Esther Huecas on 10/05/2021.
//

import Foundation

struct Person: Identifiable {
    var id: UUID = UUID()
    var name: String
    var avatar: String
    var imagePost: String
}
