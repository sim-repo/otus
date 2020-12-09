//
//  FoodDetailView.swift
//  otus.QuitSmoking
//
//  Created by Igor Ivanov on 09.12.2020.
//

import SwiftUI


struct FoodDetailView: View {
    let food: Food
    
    var body: some View {
        Text("\(food.icon)")
            .font(.system(size: 200))
    }
}
