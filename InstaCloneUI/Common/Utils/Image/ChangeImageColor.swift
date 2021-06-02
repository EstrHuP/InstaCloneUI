//
//  ChangeImageColor.swift
//  InstaCloneUI
//
//  Created by Esther Huecas on 10/05/2021.
//

import SwiftUI

public struct ColorBlended: ViewModifier {
    var color: Color
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            color.blendMode(.sourceAtop)
        }
        .drawingGroup(opaque: false)
    }
}
