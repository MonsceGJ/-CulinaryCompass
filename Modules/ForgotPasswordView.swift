//
//  ForgotPasswordView.swift
//  CulinaryCompass
//
//  Created by monscerrat gutierrez on 31/05/24.
//

import SwiftUI

import SwiftUI

struct ForgotPasswordView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.white, .yellow]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("FORGOT")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                        .padding(.top, 0)
                        .frame(alignment: .center)
                    
                    Text("PASSWORD")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding(.top, 0)
                        .frame(alignment: .center)
                    
                    Image("image") // Replace "your_logo" with the name of your image asset
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150) // Adjust size as needed
                        .padding(.top, -10)
                        
                        .padding()
                        .padding()
                    TextField("Enter your email", text: $viewModel.forgotPasswordEmail)
                        .padding()
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(10)
                        .autocapitalization(.none)
                    
                    if !viewModel.forgotPasswordErrorMessage.isEmpty {
                        Text(viewModel.forgotPasswordErrorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TLButton(
                        title: "Reset Password",
                        background: .white,
                        action: {
                            viewModel.forgotPassword()
                        },
                        width: 300,
                        height: 40
                    )
                    .padding()
                    
                    if viewModel.isForgotPasswordSuccess {
                        Text("Password reset email sent successfully.")
                            .foregroundColor(Color.green)
                    }
                    
                    Spacer()
                }
                .padding()
            }
        }
    }
}

#Preview {
    ForgotPasswordView(viewModel: LoginViewModel())
}
