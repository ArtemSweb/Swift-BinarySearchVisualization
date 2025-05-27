//
//  BinarySearchModel.swift
//  BinarySearchVisualization
//
//  Created by Артем Солодовников on 27.05.2025.
//

import Foundation

struct BinarySearchStep {
    let array: [Int]
    let leftIndex: Int
    let rightIndex: Int
    let middleIndex: Int
    let target: Int
    let isFound: Bool
}

class BinarySearchModel: ObservableObject {
    @Published var steps: [BinarySearchStep] = []
    @Published var currentStep = 0
    @Published var isSearching = false
    @Published var searchSpeed: Double = 1.0
    
    var sortedArray: [Int] = []
    var targetValue: Int = 0
    
    func generateArray(count: Int) {
        sortedArray = (0..<count).map { _ in Int.random(in: 0...100) }.sorted()
        steps.removeAll()
        currentStep = 0
    }
    
    func binarySearch(for target: Int) {
        targetValue = target
        steps.removeAll()
        currentStep = 0
        isSearching = true
        
        var left = 0
        var right = sortedArray.count - 1
        
        DispatchQueue.global().async {
            while left <= right {
                let middle = left + (right - left) / 2
                
                DispatchQueue.main.async {
                    let isFound = self.sortedArray[middle] == target
                    let step = BinarySearchStep(
                        array: self.sortedArray,
                        leftIndex: left,
                        rightIndex: right,
                        middleIndex: middle,
                        target: target,
                        isFound: isFound
                    )
                    self.steps.append(step)
                    
                    if isFound {
                        self.isSearching = false
                    }
                }
                
                Thread.sleep(forTimeInterval: 1.0 / self.searchSpeed)
                
                if self.sortedArray[middle] == target {
                    break
                } else if self.sortedArray[middle] < target {
                    left = middle + 1
                } else {
                    right = middle - 1
                }
            }
            
            DispatchQueue.main.async {
                if self.steps.last?.isFound != true {
                    self.isSearching = false
                }
            }
        }
    }
    
    func nextStep() {
        if currentStep < steps.count - 1 {
            currentStep += 1
        }
    }
    
    func previousStep() {
        if currentStep > 0 {
            currentStep -= 1
        }
    }
}
