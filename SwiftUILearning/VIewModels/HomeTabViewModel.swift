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
    @Published var addNewItem: AddNewItem = .dismiss
    
    func showViewItem() {
        switch addNewItem {
        case .expense: isNewExpenseTapped.toggle()
        case .calendar: isNewStaticExpenseTapped.toggle()
        case .receipt: isNewReceiptTapped.toggle()
        case .dismiss: break
        }
    }
    
    func optionHasTapped() {
        previousSelectedView = selectedView
    }
    
    func addHastapped() {
        isAddTapped.toggle()
        selectedView = previousSelectedView
    }
}

enum HomeOption: Int {
    case expenses = 0
    case cards = 1
    case add = 2
    case receipts = 3
    case settings = 4
}

enum AddNewItem {
    case expense
    case calendar
    case receipt
    case dismiss
}
