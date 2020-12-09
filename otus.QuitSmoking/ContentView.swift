//
//  ContentView.swift
//  otus.QuitSmoking
//
//  Created by Igor Ivanov on 08.12.2020.
//

import SwiftUI


struct ContentView: View {
    
    @State var tabSelection: Int = 2
    @State var selectedFoodID: FoodID = 0
    @State var foodFilterIsOn: Bool = false
    
    var body: some View {
        TabView(selection: $tabSelection) {
                HomeScreen(selectedFoodID: $selectedFoodID, tabSelection: $tabSelection, foodFilterIsOn: $foodFilterIsOn).tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(0)
                
                SearchScreen(selectedFoodID: $selectedFoodID, foodFilterIsOn: $foodFilterIsOn).tabItem {
                    Image(systemName: "magnifyingglass")
                        .font(Font.largeTitle.weight(.black))
                    Text("Search")
                }.tag(1)
                

                ProfileScreen().tabItem {
                    Image(systemName: "person.2")
                    Text("Profile")
                }.tag(2)
            }
        }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
