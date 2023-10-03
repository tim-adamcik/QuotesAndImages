//
//  RandomImageListViewModel.swift
//  QuotesAndImages
//
//  Created by Timothy Adamcik on 10/3/23.
//

import Foundation
import UIKit

@MainActor
class RandomImageListViewModel: ObservableObject {
    @Published var randomImages: [RandomImageViewModel] = []
    
    func getRandomImages(ids: [Int]) async {
        do {
            let randomImages = try await WebService().getRandomImages(ids: ids)
            self.randomImages = randomImages.map(RandomImageViewModel.init)
        } catch {
           print("error = \(error)")
        }
    }
    
}

struct RandomImageViewModel: Identifiable {
    let id = UUID()
    
    fileprivate let randomImage: RandomImage
    
    var image: UIImage? {
        UIImage(data: randomImage.image)
    }
    
    var quote: String {
        randomImage.quote.content
    }
}
