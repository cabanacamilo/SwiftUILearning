//
//  HomeTabViewModel.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/02/21.
//

import Foundation

class HomeTabViewModel: ObservableObject {
    
    @Published var selectedView: HomeOption = .expenses
    @Published var previousSelectedView: HomeOption = .expenses
    @Published var isAddTapped = false
    @Published var isNewExpenseTapped = false
    @Published var isNewReceiptTapped = false
    @Published var isNewStaticExpenseTapped = false
    
    func optionHasTapped() {
        previousSelectedView = selectedView
    }
    
    func addHastapped() {
        isAddTapped.toggle()
        selectedView = previousSelectedView
    }
    
    func newExpenseHasTapped() {
        isNewExpenseTapped.toggle()
    }
    
    func newReceiptHasTapped() {
        isNewReceiptTapped.toggle()
    }
    
    func newStaticExpenseHasTapped() {
        isNewStaticExpenseTapped.toggle()
    }
}

enum HomeOption: Int {
    case expenses = 0
    case cards = 1
    case add = 2
    case receipts = 3
    case settings = 4
}
