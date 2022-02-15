//
//  HomeViewModel.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/02/14.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var expenses = [Expense]()
    @Published var isLoading = false
    @Published var showError = false
    
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
}
