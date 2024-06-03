//
//  culinaryCompassView.swift
//  CulinaryCompass
//
//  Created by monscerrat gutierrez on 31/05/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    // Background Gradient
                    LinearGradient(gradient: Gradient(colors: [.white, .yellow]), startPoint: .top, endPoint: .bottom)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        // HEADER WITH LOGO
                        VStack {
                            Image("logoCulinaryCompass") // Use the name of your image asset here
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 200) // Adjust the size as needed
                                .padding(.top, 5) // Adjust the padding as needed
                        }
                        .padding(.bottom, 50)
                        
                        // LOGIN FORM
                        VStack(spacing: 20) {
                            
                            if !viewModel.errorMessage.isEmpty {
                                Text(viewModel.errorMessage)
                                    .foregroundColor(Color.red)
                            }
                            
                            TextField("Correo Electronico", text: $viewModel.email)
                                .padding()
                                .background(Color.white.opacity(0.5))
                                .cornerRadius(10)
                                .autocapitalization(.none)
                            
                            SecureField("Contraseña", text: $viewModel.password)
                                .padding()
                                .background(Color.white.opacity(0.5))
                                .cornerRadius(10)
                            
                            TLButton(
                                title: "Acceder",
                                background: .white,
                                
                                action: {
                                    viewModel.login()
                                },
                                width: 300, // Specify width
                                height: 40 // Specify height
                            )
                            .padding()
                            
                            NavigationLink("Olvidaste tu contraseña?", destination: ForgotPasswordView(viewModel: viewModel))
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.white.opacity(0.0))
                        .cornerRadius(10)
                        .offset(y: -50)
                        
                        // CREATE ACCOUNT
                        VStack {
                            Text("New around here?")
                                .foregroundColor(.white)
                            
                            NavigationLink("Create An Account", destination: RegisterView())
                                .foregroundColor(.gray)
                        }
                        .padding(.bottom, 50)
                        
                        //                    NavigationLink(destination: HomeView(), isActive: $viewModel.isAuthenticated) {
                        //                        EmptyView()
                        //                    }.hidden()
                    }
                    .padding()
                }
                // .navigationBarHidden(true) // Ocultar la barra de navegación
            }
        }
    }
}

#Preview {
    LoginView()
}
