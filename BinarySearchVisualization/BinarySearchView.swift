//
//  ContentView.swift
//  BinarySearchVisualization
//
//  Created by Артем Солодовников on 27.05.2025.
//

import SwiftUI

struct BinarySearchView: View {
    @StateObject private var model = BinarySearchModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    BinarySearchView()
}
