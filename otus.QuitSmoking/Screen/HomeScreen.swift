//
//  HomeScreen.swift
//  otus.QuitSmoking
//
//  Created by Igor Ivanov on 09.12.2020.
//

import SwiftUI

struct HomeScreen: View{
    @Binding var selectedFoodID: FoodID
    @Binding var tabSelection: Int
    @Binding var foodFilterIsOn: Bool
    
    var body: some View {
        ZStack {
            Color.neuBackground.ignoresSafeArea()
            
            Button(action: {
                    tabSelection = 1
                    foodFilterIsOn = true
                    selectedFoodID = 0
            }) {
                Text("Goto Item")
            }.buttonStyle(MyButtonStyle(bgColor: .neuBackground))
        }
    }
}
