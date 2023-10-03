//
//  ContentView.swift
//  QuotesAndImages
//
//  Created by Timothy Adamcik on 10/3/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var randomImageListVM = RandomImageListViewModel()
    
    var body: some View {
        NavigationView {
            List(randomImageListVM.randomImages) { randomImage in
                HStack {
                    randomImage.image.map {
                        Image(uiImage: $0)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    Text(randomImage.quote)
                }
            }.task {
                await randomImageListVM.getRandomImages(ids: Array(100...130))
            }
            .navigationTitle("Random Images")
            .navigationBarItems(trailing: Button(action: {
                Task {
                    await randomImageListVM.getRandomImages(ids: Array(100...130))
                }
            }, label: {
                Image(systemName: "arrow.clockwise.circle")
            }))
        }
    }
}

#Preview {
    ContentView()
}
