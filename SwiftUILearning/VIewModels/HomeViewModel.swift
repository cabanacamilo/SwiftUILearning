//
//  HomeViewModel.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/02/14.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var expenses = [Expense]()
    
    func fecthExpenses() {
        APIService.shared.fecthData { expenses in
            guard let expenses = expenses?.expenses else {
                return
            }
            self.expenses = expenses
        }
    }
}
