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
        ZStack{
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
                SettingsIView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Settings")
                    }
                    .tag(HomeOption.settings)
                    .onAppear { viewModel.optionHasTapped() }
            }
            AddView(isPresented: $viewModel.isAddTapped, addNewItem: $viewModel.addNewItem)
        }
        .onChange(of: viewModel.addNewItem, perform: { _ in
            viewModel.showViewItem()
        })
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
