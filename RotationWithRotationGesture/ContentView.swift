//
//  ContentView.swift
//  RotationWithRotationGesture
//
//  Created by Đorđije Novović on 29.8.21..
//

import SwiftUI

struct ContentView: View {
    
    @State var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Image(systemName: "heart.circle.fill")
            .font(.largeTitle)
            .foregroundColor(.orange)
            .scaleEffect(4)
            .padding(64)
            .background(Color.secondary.cornerRadius(16).opacity(0.8))
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged { value in
                        angle = value
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            angle = Angle(degrees: 0)
                        }
                    }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
