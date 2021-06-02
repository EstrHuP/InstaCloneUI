//
//  EmojiButton.swift
//  InstaCloneUI
//
//  Created by Esther Huecas on 02/06/2021.
//

import SwiftUI

struct EmojiButton: View {
    var emoji: String
    @Binding var isShowSubviewTextField: Bool
    @Binding var commentTxt: String
    
    var body: some View {
        Button {
            if self.isShowSubviewTextField == false {
                self.isShowSubviewTextField = true
            }
            self.commentTxt += emoji
        } label: {
            Text(emoji)
        }
    }
}
