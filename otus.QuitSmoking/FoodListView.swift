//
//  FoodListView.swift
//  otus.QuitSmoking
//
//  Created by Igor Ivanov on 09.12.2020.
//

import SwiftUI


struct FoodListView: View {
    @Binding var selectedFoodID: FoodID
    @Binding var foodFilterIsOn: Bool
    @EnvironmentObject var foodListVM: FoodListViewModel
    
    var filteredFoods: [Food] {
        foodListVM.foods.filter { food in
            (foodFilterIsOn && food.id == selectedFoodID || foodFilterIsOn == false)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $foodFilterIsOn) {
                    Text("Selected Only")
                }
                ForEach(filteredFoods) { food in
                    NavigationLink(
                        destination: FoodDetailView(food: food),
                        isActive: $foodFilterIsOn
                    ){
                        Text("\(food.icon)")
                    }
                }
            }.navigationTitle("Foods")
        } //NavigationView
    }
}
