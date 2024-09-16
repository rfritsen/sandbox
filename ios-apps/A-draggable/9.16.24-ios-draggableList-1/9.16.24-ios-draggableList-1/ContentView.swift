//
//  ContentView.swift
//  9.16.24-ios-draggableList-1
//
//  Created by Ryan on 9/16/24.
//
// A view conatining a list of items the user can drag to reorder.

import SwiftUI

struct ReorderableListView: View {
    @State private var items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    Text(item)
                }
                .onMove(perform: move)
            }
            .navigationTitle("Reorderable List")
            .toolbar {
                EditButton()
            }
        }
    }
    
    private func move(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Preview:
    PreviewProvider {
        static var previews: some View {
            ReorderableListView()
        }
    }
