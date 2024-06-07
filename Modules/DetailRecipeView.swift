//
//  DetailRecipeView.swift
//  CulinaryCompass
//
//  Created by monscerrat gutierrez on 06/06/24.
//

import SwiftUI

struct DetailRecipeView: View {
    var recipeDetail: CulinariCompassElement
    @ObservedObject var viewModel = DetailViewModel.shared
    @State private var isFavorite: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                AsyncImage(url: URL(string: recipeDetail.image ?? "")) { image in
                    switch image {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 200, height: 200)
                            .cornerRadius(10)
                            .shadow(color: Color.black, radius: 5)
                            .padding(.top, 50)
                    case .failure(_):
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .foregroundColor(.gray)
                            .padding(.top, 50)
                    @unknown default:
                        EmptyView()
                    }
                }
                .padding(.top, 30)
                
                Text(recipeDetail.title ?? "No title")
                    .foregroundColor(.orange)
                    .font(.title)
                    .padding(.top, 20)

                Text(recipeDetail.newCategory ?? "No category")
                    .foregroundColor(.orange)
                    .font(.headline)
                    .padding(.top, 5)
                
                Text(recipeDetail.path ?? "No path")
                    .foregroundColor(.orange)
                    .font(.subheadline)
                    .padding(.top, 5)
                
                Spacer()
                
                Button(action: {
                    if isFavorite {
                        viewModel.removeFromFavorites(receta: recipeDetail)
                    } else {
                        viewModel.addToFavorites(receta: recipeDetail)
                    }
                    isFavorite.toggle()
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(isFavorite ? .red : .white)
                        .font(.title)
                        .padding()
                }
                .padding(.bottom, 30)
            }
            .padding(.horizontal)
        }
        .onAppear {
            isFavorite = viewModel.isFavorite(receta: recipeDetail)
        }
        .onChange(of: viewModel.favorites) { _ in
            isFavorite = viewModel.isFavorite(receta: recipeDetail)
        }
    }
}



