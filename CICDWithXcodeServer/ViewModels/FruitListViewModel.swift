//
//  FruitListViewModel.swift
//  CICDWithXcodeServer
//
//  Created by ReliSource Technologies Ltd. on 6/18/22.
//

import Foundation

class FruitListViewModel: ObservableObject {
    @Published private(set) var fruits: [Fruit] = []

    func loadFruits() {
        fruits = loadJson(filename: "mock")
    }

    private func loadJson(filename fileName: String) -> [Fruit] {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Fruit].self, from: data)
                return jsonData
            } catch {
                print("Error getting JSON:\(error)")
            }
        }
        return []
    }
}
