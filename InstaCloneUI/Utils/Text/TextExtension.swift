//
//  TextExtension.swift
//  InstaCloneUI
//
//  Created by Esther Huecas on 11/05/2021.
//

import SwiftUI

extension Text {
    func textStylePrimary() -> some View {
        self
            .font(.system(size: 13))
            .foregroundColor(Color("PrimaryFontColor"))
            .bold()
    }
    
    func textStyleSecondary() -> some View {
        self
            .font(.system(size: 12))
            .foregroundColor(Color("SecondaryFontColor"))
    }
    
    func textStyleTertiary() -> some View {
        self
            .font(.system(size: 12))
            .foregroundColor(Color("TertiaryFontColor"))
    }
}
