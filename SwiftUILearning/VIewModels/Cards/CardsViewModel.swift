//
//  CardsViewModel.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/03/02.
//

import Foundation

class CardsViewModel: ObservableObject {
    
    @Published var pageIndex = 0
    @Published var isAddCardPresented = false
    @Published var isAddExpenseToCard = false
}
