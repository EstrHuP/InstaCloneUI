//
//  Comments.swift
//  InstaCloneUI
//
//  Created by Esther Huecas on 11/05/2021.
//

import SwiftUI

struct MiniCommentsPostView: View {
    var person: Person
    @State var commentTxt: String = ""
    @State var isShowSubviewTextField: Bool = false
    @State var height: CGFloat = 0
    @Binding var clickedOut: Bool //state comming into this view change
    let placeholder = "Add a comment"
    
    func emojiButton(_ emoji: String) -> Button<Text> {
        Button {
            if self.isShowSubviewTextField == false {
                self.isShowSubviewTextField = true
            }
            self.commentTxt += emoji
        } label: {
            Text(emoji)
        }
    }
    
    var body: some View {
        ZStack {
            //Textfield and icons design
            HStack(spacing: 5) {
                PersonAvatarView(person: person, width: 25, lineWidth: 2)
                    .padding(.trailing, 5) //distancia hasta el textfield
                
                TextField(placeholder, text: $commentTxt,
                          onEditingChanged: {_ in
                            if self.clickedOut == true {
                                self.clickedOut = false
                            }
                            self.clickedOut = true
                          })
                    .frame(height: 40)
                    .padding(.leading, 10)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("PrimaryColor"), lineWidth: 0.10))
                
                emojiButton("👩🏻‍💻")
                emojiButton("🤎")
                Image(systemName: "plus.circle")
                    .myStyleTertiary()
                    .frame(width: 15)
                    .padding(.trailing, 60)
            }
            .onAppear {
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (noti) in
                    guard let notiUser = noti.userInfo else { return }
                    let value = notiUser[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                    self.height = value.height
                    self.clickedOut = false
                }
                
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (noti) in
                    self.height = 0
                    self.isShowSubviewTextField = false
                }
            }
            
            if self.isShowSubviewTextField == true {
                VStack(spacing: 5) { //distancia de arriba
                    HStack(spacing: 30){ //distancia entre emoticonos
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
                    .padding(.trailing, 60) //margen derecho

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
                    .padding(.trailing, 60)
                }
                .background(Color("PrimaryColorInvert"))
            }
        }
        //Hide keyboard
        .onChange(of: self.clickedOut) { [clickedOut] clickedOutNew in
            if clickedOutNew == true {
                self.isShowSubviewTextField = false
            }
        }
    }
}
