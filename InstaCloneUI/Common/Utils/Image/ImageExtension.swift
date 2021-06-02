//
//  ImageExtension.swift
//  InstaCloneUI
//
//  Created by Esther Huecas on 10/05/2021.
//

import SwiftUI

extension Image {
    func myStylePrimary() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .modifier(ColorBlended(color: Color("PrimaryColor")))
    }
    
    func myStyleSecondary() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .modifier(ColorBlended(color: Color("SecondaryColor")))
    }
    
    func myStyleTertiary() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .modifier(ColorBlended(color: Color("TertiaryColor")))
    }
}
