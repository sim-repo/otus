//
//  FoodViewModel.swift
//  otus.QuitSmoking
//
//  Created by Igor Ivanov on 09.12.2020.
//

import Foundation

final class FoodListViewModel: ObservableObject {
    @Published private(set) var foods = [
        Food(id: 0, icon: "🧇"),
        Food(id: 1, icon: "🧆"),
        Food(id: 2, icon: "🧈"),
        Food(id: 3, icon: "🌭"),
        Food(id: 4, icon: "🌯"),
        Food(id: 5, icon: "🌰"),
        Food(id: 6, icon: "🌶"),
        Food(id: 7, icon: "🌽"),
        Food(id: 8, icon: "🍅"),
        Food(id: 9, icon: "🍍"),
        Food(id: 10, icon: "🥑"),
        Food(id: 11, icon: "🍗")
    ]
}
