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
                
                EmojiButton(emoji: "👩🏻‍💻", isShowSubviewTextField: self.$isShowSubviewTextField, commentTxt: self.$commentTxt)
                EmojiButton(emoji: "🤎", isShowSubviewTextField: self.$isShowSubviewTextField, commentTxt: self.$commentTxt)
                
                Image(systemName: "plus.circle")
                    .myStyleTertiary()
                    .frame(width: 15)
                    .padding(.trailing, 40)
            }
            .onAppear {
                UIScrollView.appearance().keyboardDismissMode = .onDrag
                
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
                WriteCommentView(person: person, isShowSubviewTextField: self.$isShowSubviewTextField, commentTxt: self.$commentTxt)
            }
                
        }
        //Hide keyboard
        .onChange(of: self.clickedOut) { clickedOutNew in
            if clickedOutNew == true {
                self.isShowSubviewTextField = false
            }
        }
    }
}
