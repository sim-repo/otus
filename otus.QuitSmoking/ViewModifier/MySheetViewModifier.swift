//
//  BottomSheetView.swift
//  otus.QuitSmoking
//
//  Created by Igor Ivanov on 09.12.2020.
//

import SwiftUI

struct MySheetViewModifier: ViewModifier {
    @Binding var isPresented: Bool
    func body(content: Content) -> some View {
        SlidingSheet(isPresented: $isPresented) {
            content
        }
    }
}

extension View {
    func customBottomSheet(isPresented: Binding<Bool>) -> some View {
        self.modifier(MySheetViewModifier(isPresented: isPresented))
    }
}


/*
 Ручной слайдер для модального окна
 */

struct SlidingSheet<Content: View> : View {
    @GestureState private var dragState: DragState = .inactive
    @State var position: SheetPosition = .top
    @Binding var isPresented: Bool
    
    var content: () -> Content
    var body: some View {
        let drag = DragGesture()
            .updating($dragState) { drag, state, transaction in
                state = .dragging(translation: drag.translation)
            }
            .onEnded(onDragEnded)
        
        return Group {
            self.content()
                .onChange(of: isPresented, perform: { value in
                    position = value ? .top : .bottom
                })
        }
        .frame(height: UIScreen.main.bounds.height)
        .background(Color.neuBackground)
        .cornerRadius(10.0)
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.13), radius: 10.0)
        .offset(y: self.position.rawValue + self.dragState.translation.height)
        .animation(self.dragState.isDragging ? nil : .interpolatingSpring(mass: 2, stiffness: 100, damping: 18, initialVelocity: 10))
        .gesture(drag)
    }

    private func onDragEnded(drag: DragGesture.Value) {
        let verticalDirection = drag.predictedEndLocation.y - drag.location.y
        let sheetTopEdgeLocation = self.position.rawValue + drag.translation.height
        let positionAbove: SheetPosition
        let positionBelow: SheetPosition
        let closestPosition: SheetPosition

        if sheetTopEdgeLocation <= SheetPosition.middle.rawValue {
            positionAbove = .top
            positionBelow = .middle
        } else {
            positionAbove = .middle
            positionBelow = .bottom
            isPresented = false
        }

        if (sheetTopEdgeLocation - positionAbove.rawValue) < (positionBelow.rawValue - sheetTopEdgeLocation) {
            closestPosition = positionAbove
        } else {
            closestPosition = positionBelow
        }

        if verticalDirection > 0 {
            self.position = positionBelow
        } else if verticalDirection < 0 {
            self.position = positionAbove
        } else {
            self.position = closestPosition
        }
    }
}

enum SheetPosition: CGFloat {
    case top = 100
    case middle = 500
    case bottom = 850
}

enum DragState {
    case inactive
    case dragging(translation: CGSize)

    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }

    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}
