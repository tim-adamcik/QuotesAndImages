//
//  ContentView.swift
//  QuotesAndImages
//
//  Created by Timothy Adamcik on 10/3/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        Text("Go home")
    }
}

#Preview {
    ContentView()
}
