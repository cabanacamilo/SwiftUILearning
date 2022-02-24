//
//  HomeTabView.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/02/21.
//

import SwiftUI

struct HomeTabView: View {
    
    @StateObject private var viewModel = HomeTabViewModel()
    
    var body: some View {
        TabView(selection: $viewModel.selectedView) {
            ExpensesView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(HomeOption.expenses)
                .onAppear { viewModel.optionHasTapped() }
            CardsView()
                .tabItem {
                    Image(systemName: "creditcard.fill")
                    Text("Cards")
                }
                .tag(HomeOption.cards)
                .onAppear { viewModel.optionHasTapped() }
            Text("Add")
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                }
                .tag(HomeOption.add)
                .onAppear { viewModel.addHastapped() }
            ReceiptsView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Receipts")
                }
                .tag(HomeOption.receipts)
                .onAppear { viewModel.optionHasTapped() }
            Text("Settings")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Settings")
                }
                .tag(HomeOption.settings)
                .onAppear { viewModel.optionHasTapped() }
        }
        .actionSheet(isPresented: $viewModel.isAddTapped) {
            ActionSheet(title: Text("Add New"), message: nil, buttons: [
                .default(Text("Expense"), action: viewModel.newExpenseHasTapped),
                .default(Text("Static"), action: viewModel.newStaticExpenseHasTapped),
                .default(Text("Receipt"), action: viewModel.newReceiptHasTapped),
                .cancel()
            ])
        }
        .sheet(isPresented: $viewModel.isNewExpenseTapped) {
            Text("New Expense")
        }
        .sheet(isPresented: $viewModel.isNewReceiptTapped) {
            Text("New receipt")
        }
        .sheet(isPresented: $viewModel.isNewStaticExpenseTapped) {
            Text("New static")
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
