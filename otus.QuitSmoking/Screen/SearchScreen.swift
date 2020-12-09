//
//  SearchScreen.swift
//  otus.QuitSmoking
//
//  Created by Igor Ivanov on 09.12.2020.
//

import SwiftUI

struct SearchScreen: View {
    @Binding var selectedFoodID: FoodID
    @Binding var foodFilterIsOn: Bool
    
    var body: some View {
        ZStack {
            Color.neuBackground.ignoresSafeArea()
            FoodListView(selectedFoodID: $selectedFoodID, foodFilterIsOn: $foodFilterIsOn).environmentObject(FoodListViewModel())
        }
    }
}
