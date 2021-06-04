//
//  LoginView.swift
//  InstaCloneUI
//
//  Created by Esther Huecas on 02/06/2021.
//

import SwiftUI
import LocalAuthentication

struct LoginView: View {
    
    @State var userNameTxt = ""
    @State var passwordTxt = ""
    @AppStorage("stored_User") var user = "ehue@gmail.com"
    @AppStorage("status") var logged = false
    
    var body: some View {
           
        VStack {
            //Logo
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                //Dynamic frame
                .padding(.horizontal, 35)
                .padding(.vertical )
            
            //Login text
            HStack {
                VStack(alignment: .leading, spacing: 12, content: {
                    Text("Login")
                        .font(.title2)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    
                    Text("Please sign in to continue")
                        .foregroundColor(.gray)
                        .foregroundColor(Color.black.opacity(0.5))
                })
                Spacer(minLength: 0) //no dejar espacio entre izquierda y derecha
            }
            .padding()
            .padding(.leading)
            
            //Email Textfield
            HStack {
                Image(systemName: "envelope")
                    .font(.title2)
                    .foregroundColor(.black)
                    .frame(width: 35)
                TextField("EMAIL", text: $userNameTxt)
            }
            .padding()
            .background(Color.gray.opacity(userNameTxt == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            
            
            //Password Textfield
            HStack {
                Image(systemName: "lock")
                    .font(.title2)
                    .foregroundColor(.black)
                    .frame(width: 35)
                SecureField("PASSWORD", text: $passwordTxt)
                
            }
            .padding()
            .background(Color.gray.opacity(passwordTxt == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.top)
            
            //Login button
            HStack(spacing: 15) {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("LOGIN")
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color.gray.opacity(0.30))
                        .cornerRadius(15)
                })
                .opacity(userNameTxt != "" && passwordTxt != "" ? 1 : 0.30)
                .disabled(userNameTxt != "" && passwordTxt != "" ? false : true)
                
                if getBiometricStatus() {
                    Button(action: authenticateUser, label: {
                        //getting biometric type
                        Image(systemName: LAContext().biometryType == .faceID ? "faceid" : "touchid")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.gray.opacity(0.30))
                            .cornerRadius(15)
                    })
                }
            }
            
            //Forget password
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Forget password?")
                    .foregroundColor(.black)
            })
            .padding(.top, 8)
            Spacer(minLength: 0) //no dejar espacio arriba
            
            //Sign up
            HStack(spacing: 6) {
                Text("Don't have an account?")
                    .foregroundColor(.gray)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Signup")
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                })
            }
            .padding(.vertical)
        }
        .background(Color("LoginBackgroundColor").ignoresSafeArea(.all, edges: .all))
        .animation(.easeOut)
    }
    
    func getBiometricStatus() -> Bool {
        let scanner = LAContext()
        if self.userNameTxt == user && scanner.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: .none) {
            return true
        }
        return false
    }
    
    func authenticateUser() {
        let scanner = LAContext()
        scanner.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To unlock \(userNameTxt)") { (status, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            //setting logged status as true
            withAnimation(.easeOut) {
                logged = true
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
