//
//  ContentView.swift
//  9.17.24-pinterest-buttons-1
//
//  Created by Ryan on 9/17/24.
//
// https://www.perplexity.ai/search/write-a-pinterest-style-interf-xahXsFlDSiWaeIrKJ7nnHQ


import SwiftUI

struct ContentView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let photos = [
        Photo(id: 1, imageName: "photo1"),
        Photo(id: 2, imageName: "photo2"),
        // Add more photos
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(photos) { photo in
                    PhotoCell(photo: photo)
                }
            }
            .padding()
        }
    }
}

struct PhotoCell: View {
    let photo: Photo
    @State private var isLiked = false
    
    var body: some View {
        VStack {
            Image(photo.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
            
            HStack {
                Button(action: {}) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .foregroundColor(isLiked ? .red : .gray)
                }
                .buttonStyle(PinterestButtonStyle(
                    action: { isLiked.toggle() },
                    longPressAction: { print("Long press like") }
                ))
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.gray)
                }
                .buttonStyle(PinterestButtonStyle(
                    action: { print("Share tapped") },
                    longPressAction: { print("Long press share") }
                ))
            }
            .padding(.horizontal)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct PinterestButtonStyle: ButtonStyle {
    let action: () -> Void
    let longPressAction: () -> Void
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .contentShape(Rectangle())
            .gesture(
                LongPressGesture(minimumDuration: 0.5)
                    .onEnded { _ in
                        longPressAction()
                    }
            )
            .simultaneousGesture(
                TapGesture()
                    .onEnded { _ in
                        action()
                    }
            )
    }
}
