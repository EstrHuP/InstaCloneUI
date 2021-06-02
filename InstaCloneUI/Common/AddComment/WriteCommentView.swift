//
//  WriteCommentView.swift
//  InstaCloneUI
//
//  Created by Esther Huecas on 02/06/2021.
//

import SwiftUI

struct WriteCommentView: View {
    var person: Person
    @Binding var isShowSubviewTextField: Bool
    @Binding var commentTxt: String
    
    var body: some View {
        VStack(spacing: 5) { //distancia de arriba
            HStack(spacing: 20){ //distancia entre emoticonos
                emojiButton("❤️")
                emojiButton("🙌")
                emojiButton("🔥")
                emojiButton("👏")
                emojiButton("😥")
                emojiButton("😍")
                emojiButton("😮")
                emojiButton("😂")
            }
            .font(.system(size: 20)) //tamaño de los emojis
            .padding(.top, 5) //margen arriba
            .padding(.trailing, 40) //margen derecho

            HStack {
                PersonAvatarView(person: person, width: 25, lineWidth: 2)
                    .padding(.trailing, 5) //distancia hasta el textfield

                HStack {
                    CustomTextField(text: $commentTxt, isFirstResponder: self.isShowSubviewTextField)
                    
                    Button {

                    } label: {
                        Text("Post")
                            .foregroundColor(Color("SecondaryColor"))
                            .font(.system(size: 14))
                            .opacity(0.5)
                    }
                    .padding(.trailing, 10)
                }
                .padding(.leading, 10)
                .frame(height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color("SecondaryColor"), lineWidth: 0.25)
                )
            }
            .padding(.trailing, 40)
        }
        .background(Color("PrimaryColorInvert"))
    }
}

extension WriteCommentView {
    func emojiButton(_ emoji: String) -> some View {
        EmojiButton(emoji: emoji, isShowSubviewTextField: self.$isShowSubviewTextField, commentTxt: self.$commentTxt)
    }
}
