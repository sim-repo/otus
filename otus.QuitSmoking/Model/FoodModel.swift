//
//  FoodModel.swift
//  otus.QuitSmoking
//
//  Created by Igor Ivanov on 08.12.2020.
//

import Foundation

typealias FoodID = Int

struct Food: Identifiable {
    let id: FoodID
    let icon: String
}
