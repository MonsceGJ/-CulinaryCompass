//
//  TLButton.swift
//  CulinaryCompass
//
//  Created by monscerrat gutierrez on 31/05/24.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    var width: CGFloat = 100 // Default width
    var height: CGFloat = 50 // Default height
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                    .frame(width: width, height: height)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white.opacity(isPressed ? 0.8 : 0.3), lineWidth: 2)
                            .brightness(isPressed ? 0.2 : 0) // Adjust brightness when pressed
                    )
                
                Text(title)
                    .foregroundColor(Color.orange)
                    .bold()
            }
        }
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    withAnimation {
                        self.isPressed = true
                    }
                }
                .onEnded { _ in
                    withAnimation {
                        self.isPressed = false
                    }
                }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "Value", background: .pink, action: {
            // ACTION
        }, width: 300, height: 40)
    }
}
