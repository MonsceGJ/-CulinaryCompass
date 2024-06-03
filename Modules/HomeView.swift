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
                        Image(systemName: "movieclapper")
                        Text("Generos")
                    }.tag(1)
                
                Home()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Inicio")
                            .foregroundColor(.pink)
                    }.tag(2)
                
                FavoritesView()
                    .tabItem {
                        Image(systemName: "heart")
                        Text("Favoritos")
                    }.tag(3)
            }
            .accentColor(.orange)
        }
    }
}

struct Home:View {
    
    
    
    
    var body: some View{
        
        
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [.yellow, .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            
            
            VStack{
                
                
                
                Image("logoCulinaryCompass").resizable().aspectRatio(contentMode: .fit).frame(width: 150).padding(.vertical, 11.0)
//                Text("Buscar Recetas")
//                    .font(.title)
//                    .foregroundColor(.black)
//                    .padding(.bottom, 20)
                
                
                ScrollView(showsIndicators: false){
                   SubModuloHome()
                    
                }
                
                
            }.padding(.horizontal, 18.0)
            
            
            
        }.navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    
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
            
        }
    }
    func buscarReceta(name:String) {
        
    }
}

  
#Preview() {
    HomeView()
}

