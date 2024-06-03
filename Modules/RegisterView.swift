//
//  RegisterView.swift
//  CulinaryCompass
//
//  Created by monscerrat gutierrez on 31/05/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = LoginViewModel()
    @State private var showAlert = false
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    // Background Gradient
                    LinearGradient(gradient: Gradient(colors: [.white, .yellow]), startPoint: .top, endPoint: .bottom)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        // HEADER WITH LOGO AND TITLE
                        VStack {
                            Image("logoCulinaryCompass")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 200)
                                .padding(.top, 50) // Adjust the padding as needed
                            
                            Text("REGISTRATE")
                                .font(.system(size: 50))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.top, 10) // Adjust the padding as needed
                            
                            //                        Text("Descubrir Recetas")
                            //                            .font(.system(size: 30))
                            //                            .foregroundColor(.gray)
                            //                            .padding(.top, 0) // Adjust the padding as needed
                        }
                        
                        VStack(spacing: 20) {
                            
                            TextField("Nombre Completo", text: $viewModel.name)
                                .padding()
                                .background(Color.white.opacity(0.5))
                                .cornerRadius(10)
                            
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
                                title: "Crear una Cuenta",
                                background: .white,
                                action: {
                                    viewModel.register {
                                        success in
                                        if !success {
                                            showAlert = true
                                        }
                                    }
                                },
                                width: 300, // Specify width
                                height: 40 // Specify height
                            )
                            .padding()
                        }
                        .padding()
                    }
                    .offset(y: -50)
                    
                    Spacer()
                }
                .navigationTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .fullScreenCover(isPresented: $viewModel.isRegistered) {
                     HomeView()
                }
                .alert(isPresented: $showAlert) {
                    Alert(title:  Text("Error"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")))
                }
            }
        }
    }
}

#Preview {
    RegisterView()
}
