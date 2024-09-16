//
//  ContentView.swift
//  drag_tutorial_1
//
//  Created by Ryan on 8/9/24.
//
// Comments:
//
// 


import SwiftUI

struct ContentView: View {
    
    @State var isDragging = false
    @State var position = CGSize.zero
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .frame(width: 250, height: 200)
            .foregroundColor(.blue)
            .offset(x: position.width, y: position.height)
            //.animation(.spring)
            .gesture(
                DragGesture()
                .onChanged({ value in
                    position = value.translation
                    isDragging = true
                })
                    .onEnded({ value in
                        position = value.translation
                        isDragging = false
                    })
            )
    }
}

#Preview {
    ContentView()
}
