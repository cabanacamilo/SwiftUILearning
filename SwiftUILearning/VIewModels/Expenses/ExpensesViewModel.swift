//
//  HomeViewModel.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/02/14.
//

import Foundation

@MainActor

class ExpensesViewModel: ObservableObject {
    
    @Published var expenses = [Expense]()
    @Published var isLoading = false
    @Published var showError = false
    @Published var isFilterShowing = false
    @Published var isCreatingFileShowing = false
    
    func fecthExpenses() async {
        self.isLoading = true
        let result = await APIService.shared.fecthExpenses()
        self.isLoading = false
        guard let expenses = result?.expenses else {
            self.showError = true
            return
        }
        self.showError = false
        self.expenses = expenses
    }
}
