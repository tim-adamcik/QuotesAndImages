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
        
        let webService = WebService()
        randomImages = []
        do {
            // let randomImages = try await WebService().getRandomImages(ids: ids)
            // self.randomImages = randomImages.map(RandomImageViewModel.init)
            
            try await withThrowingTaskGroup(of: (Int, RandomImage).self, body: { group in
                for id in ids {
                    group.addTask {
                        return (id, try await webService.getRandomImage(id: id))
                    }
                }
                
                for try await (_, randomImage) in group {
                    randomImages.append(RandomImageViewModel(randomImage: randomImage))
                }
            })
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
