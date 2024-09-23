//
//  ContentView.swift
//  9.17.24-draggable-math-operators-1
//
//  Created by Ryan on 9/17/24.
//

import SwiftUI

struct ContentView: View {
    @State private var equations: [DraggableEquation] = [
        DraggableEquation(id: 0, equation: "2 + 2 = 4", position: .zero),
        DraggableEquation(id: 1, equation: "3 × 3 = 9", position: .zero),
        DraggableEquation(id: 2, equation: "5² = 25", position: .zero)
    ]
    
    var body: some View {
        ZStack {
            ForEach(equations) { equation in
                DraggableEquationView(equation: equation) { newPosition in
                    if let index = equations.firstIndex(where: { $0.id == equation.id }) {
                        equations[index].position = newPosition
                    }
                }
            }
        }
    }
}

struct DraggableEquation: Identifiable {
    let id: Int
    let equation: String
    var position: CGPoint
}

struct DraggableEquationView: View {
    let equation: DraggableEquation
    let onDragChanged: (CGPoint) -> Void
    
    @State private var dragOffset: CGSize = .zero
    
    var body: some View {
        Text(equation.equation)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .offset(x: equation.position.x + dragOffset.width,
                    y: equation.position.y + dragOffset.height)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        dragOffset = value.translation
                    }
                    .onEnded { value in
                        let newPosition = CGPoint(
                            x: equation.position.x + value.translation.width,
                            y: equation.position.y + value.translation.height
                        )
                        onDragChanged(newPosition)
                        dragOffset = .zero
                    }
            )
    }
}
