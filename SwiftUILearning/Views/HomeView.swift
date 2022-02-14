//
//  HomeView.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/02/14.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.expenses) { expense in
                NavigationLink(destination: DetailExpensesView(expense: expense)) {
                    Text("\(expense.merchant ?? "") - ¥\(expense.amountCents ?? 0)")
                }
            }
            .navigationTitle("Home")
        }
        .onAppear(perform: viewModel.fecthExpenses)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
