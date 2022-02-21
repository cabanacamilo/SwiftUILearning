//
//  HomeViewModel.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/02/14.
//

import Foundation

class ExpensesViewModel: ObservableObject {
    
    @Published var expenses = [Expense]()
    @Published var isLoading = false
    @Published var showError = false
    @Published var isFilterShowing = false
    @Published var isCreatingFileShowing = false
    
    func fecthExpenses() {
        isLoading = true
        APIService.shared.fecthData { [weak self] expenses in
            guard let self = self else { return }
            self.isLoading = false
            guard let expenses = expenses?.expenses else {
                self.showError = true
                return
            }
            self.showError = false
            self.expenses = expenses
        }
    }
    
    func filterButtonTapped() {
        if isFilterShowing {
            isFilterShowing = false
        } else {
            isFilterShowing = true
        }
        
    }
    
    func fileButtonTapped() {
        if isCreatingFileShowing {
            isCreatingFileShowing = false
        } else {
            isCreatingFileShowing = true
        }
    }
}
