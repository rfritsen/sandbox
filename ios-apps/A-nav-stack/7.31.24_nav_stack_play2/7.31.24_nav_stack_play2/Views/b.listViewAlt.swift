//
//  b.listViewAlt.swift
//  7.31.24_nav_stack_play2
//
//  Created by Ryan on 7/31/24.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            NavigationLink("StrK", destination: ListView())
        }.navigationTitle("See platforms")
            .buttonStyle(YellowButtonStyle())
    }
}

struct ContainerView<Content: View>: View {
    @ViewBuilder let content: Content
    
    var body: some View {
        content
    }
}

struct SimpleView: View {
    var body: some View {
        ContainerView {
        Text("SimpleView Text")
        }
    }
}




struct ListView: View {
    
    var body: some View {
        NavigationStack{
        List {
            Section("Platforms") {
                ForEach(platforms, id: \.name) { platform in
                    NavigationLink(value: platform) {
                        Text(platform.name)
                }
            }
        }
    }.navigationDestination(for: Platform.self) { platform in
        Text(platform.name)
                    .font(.largeTitle).bold()
                    }
                }
            }
            }
