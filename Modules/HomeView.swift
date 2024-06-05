//
//  HomeView.swift
//  CulinaryCompass
//
//  Created by monscerrat gutierrez on 01/06/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var tabSeleccionado: Int = 2
    
    var body: some View {
        NavigationView {
            TabView(selection: $tabSeleccionado) {
                
                GenderView()
                    .tabItem {
                        Image(systemName: "plus.app")
                        Text("Agregar")
                    }.tag(1)
                
                Home()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Inicio")
                      
                    }.tag(2)
                
                FavoritesView()
                    .tabItem {
                        Image(systemName: "square.and.arrow.down")
                        Text("Guardados")
                    }.tag(3)
            }
            .accentColor(.orange)
        }
    }
}

struct Home:View {
    
    @State private var mostrarPerfil: Bool = false
    
    
    var body: some View{
        NavigationView {
            ZStack{
                
                LinearGradient(gradient: Gradient(colors: [.yellow, .white]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                mostrarPerfil.toggle()
                            }
                        }){
                            Image(systemName: "person.crop.circle")
                                .foregroundColor(.brown.opacity(0.6))
                                .font(.system(size: 35))
                                .padding(.horizontal, 30)
                        }
                    }
                    
                    .padding(.trailing)
                    
                    
                    Image("logoCulinaryCompass").resizable().aspectRatio(contentMode: .fit).frame(width: 150).padding(.vertical, 11.0)
                    //
                    ScrollView(showsIndicators: false){
                        SubModuloHome()
                        
                    }
                    
                    
                }.padding(.horizontal, 18.0)
                
                
                
            }.navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            
        }
        .overlay(
            Group {
                if mostrarPerfil {
                    PerfilPopupView(cerrarPopup: {
                        withAnimation {
                            mostrarPerfil = false
                        }
                    })
                    .transition(.move(edge: .trailing))
                }
            }
            )
    }
            
            

}

struct SubModuloHome: View {
    
    @State var textoBusqueda: String = ""
    @State var isGameViewActive = false
    @State var isGameInfoEmpty = false
    
    var body: some View {
        VStack {
            HStack{
                Button(action: {buscarReceta(name: textoBusqueda)}, label: {
                    Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? Color(.orange) : Color(.black) )
                }).alert(isPresented: $isGameInfoEmpty) {
                    Alert(title: Text("Error"), message: Text("No se encontro la receta"), dismissButton: .default(Text("Entendido")))
                }
                
                
                ZStack(alignment: .leading){
                    
                    
                    
                    if textoBusqueda.isEmpty { Text("Buscar ingrediente").foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0)) }
                    
                    
                    TextField("", text: $textoBusqueda).foregroundColor(.orange)
                    
                    
                }
            }.padding([.top, .leading, .bottom], 11.0)
                .background(Color(.white))
                .clipShape(Capsule())
            
            Text("LAS MÁS POPULARES").font(.title3).foregroundColor(.orange).bold().frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                .padding(.top)
            
            ZStack {
                
                // aqui debes poner las recetas mas populares
                
                Button( action: {buscarReceta(name: "The Witcher 3")}, label: {
                    
                    VStack(spacing: 0) {
                        
                        Image("The Witcher 3").resizable().scaledToFill()
                        
                        
                        Text("Huevito con jamon").frame(minWidth: 0,  maxWidth: .infinity,  alignment: .leading).background(Color("Blue-Gray"))
                        
                    }
                    
                    
                })
                
                Image(systemName: "play.circle.fill").resizable().foregroundColor(.white).frame(width: 42.0, height: 42.0)
                
            }.frame(minWidth: 0, maxWidth: .infinity,alignment: .center)
                .padding(.vertical)
            
            
            Text("CATEGORÍAS SUGERIDAS PARA TI").font(.title3).foregroundColor(.orange).bold().frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
            
            
            ScrollView(.horizontal,showsIndicators: false){
                
                
                HStack{
                    
                    Button(action: {}, label: {
                        
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(.white))
                                .frame(width: 160, height: 90)
                            
                            Image("house").resizable().scaledToFit().frame(width: 42, height: 42)
                            
                            
                            
                        }
                        
                    })
                    
                    Button(action: {}, label: {
                        
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(.white))
                                .frame(width: 160, height: 90)
                            
                            Image("RPG").resizable().scaledToFit().frame(width: 42, height: 42)
                            
                            
                            
                        }
                        
                    })
                    
                    Button(action: {}, label: {
                        
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(.white))
                                .frame(width: 160, height: 90)
                            
                            Image("OpenWorld").resizable().scaledToFit().frame(width: 42, height: 42)
                            
                            
                            
                        }
                        
                    })
                    
                    
                    Button(action: {}, label: {
                        
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(.white))
                                .frame(width: 160, height: 90)
                            
                            Image("RPG").resizable().scaledToFit().frame(width: 42, height: 42)
                            
                            
                            
                        }
                        
                    })
                    
                    Button(action: {}, label: {
                        
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(.white))
                                .frame(width: 160, height: 90)
                            
                            Image("OpenWorld").resizable().scaledToFit().frame(width: 42, height: 42)
                            
                            
                            
                        }
                        
                    })
                }
            }
            
            
        }
    }
    
    // logica de la busqueda
    func buscarReceta(name:String) {
        
    }
}


struct PerfilPopupView: View {
    var cerrarPopup: () -> Void
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.yellow.opacity(0.6)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    cerrarPopup()
                }
            
            VStack(alignment: .trailing, spacing: 20) {
                VStack(alignment: .leading, spacing: 20) {
                    NavigationLink(destination: ProfileView(viewModel: SaveData()))
                    {
                        Text("Perfil")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                            .padding()
                    }
                    Divider()
                        .background(Color.white)
                    Spacer()
                    NavigationLink(destination: LoginView()) {
                        Text("Cerrar sesión")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .padding()
                    }
                }
                .background(Color.brown.opacity(0.5))
                .frame(width: 200)
                .cornerRadius(10)
                .shadow(radius: 10)
                .padding()
                .padding(.top, 50)
            }
        }
    }
}

  
#Preview() {
    HomeView()
}

