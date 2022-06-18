//
//  ContentView.swift
//  CICDWithXcodeServer
//
//  Created by ReliSource Technologies Ltd. on 6/18/22.
//

import SwiftUI

struct FruitRow: View {
    var fruit: Fruit

    var body: some View {
        Text(fruit.name)
    }
}

struct ContentView: View {
    @ObservedObject var viewModel = FruitListViewModel()

    var body: some View {
        return
            NavigationView {
                List(viewModel.fruits) { fruit in
                    FruitRow(fruit: fruit)
                }
                .onAppear {
                    self.viewModel.loadFruits()
                }
                .navigationBarTitle("Fruits")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
