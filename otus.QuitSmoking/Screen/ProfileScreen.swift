//
//  ProfileScreen.swift
//  otus.QuitSmoking
//
//  Created by Igor Ivanov on 09.12.2020.
//

import SwiftUI

struct ProfileScreen: View {
    
    @State var isModalViewShown: Bool = true
    @State var time: Date = Date()
    @State var eventDesc: String = ""
    
    
    
    var body: some View {
        GeometryReader { geometry in
            let widht = geometry.size.width
            ZStack {
                Color.neuBackground.ignoresSafeArea()
                
                VStack {
                    HStack {
                        Spacer()
                        Button("calendar", action: {isModalViewShown.toggle()})
                            .buttonStyle(MyButtonStyle(bgColor: .neuBackground))
                    }
                    .padding(8)
                    Spacer()
                }
                
                VStack() {
                    Divider()
                    TextField("event:", text: $eventDesc)
                    Divider()
                    DatePicker(
                        "time:",
                        selection: $time,
                        displayedComponents: .hourAndMinute
                    )
                    .pickerStyle(MenuPickerStyle())
                    Spacer()
                }
                .padding(32)
                .accentColor(.black)
                .background(Color.neuBackground)
                .frame(width: widht)
                .customBottomSheet(isPresented: $isModalViewShown)
            }
        }
    }
}
