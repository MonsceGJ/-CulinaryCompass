//
//  RegisterView.swift
//  CulinaryCompass
//
//  Created by monscerrat gutierrez on 31/05/24.
//

import SwiftUI


struct RegisterView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.yellow]),
                               startPoint: .top,
                               endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    VStack(spacing: 80) {
                        Text("REGISTRATE")
                            .font(.system(size: 50, weight: .bold))
                            .foregroundColor(.orange)
                            .padding()
                     
                    }
                 
                    
                    Spacer()
                    
                    TextField("Nombre Completo", text: $viewModel.name)
                        .padding()
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(10)
                        .textFieldStyle(PlainTextFieldStyle())
                        .autocorrectionDisabled()
                        .padding()
                    
                    TextField("Correo Electronico", text: $viewModel.email)
                        .padding()
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(10)
                        .textFieldStyle(PlainTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        .padding()
                    SecureField("Contraseña", text: $viewModel.password)
                        .padding()
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(10)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                    
                    
                    Button(action: {
                        viewModel.register()
                        
                    }) {
                        Text("Registrar")
                            .foregroundColor(.orange)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding()
                    }
                    Spacer()
                }
                .padding()
            
            }
        }
    }
}

#Preview {
    RegisterView()
}
