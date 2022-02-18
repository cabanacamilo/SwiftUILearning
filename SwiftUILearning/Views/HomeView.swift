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
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .tint(.gray)
                        .scaleEffect(2)
                }
                
                if viewModel.showError {
                    Text("Cannot Load Data")
                } else {
                    List(viewModel.expenses) { expense in
                        NavigationLink(destination: DetailExpensesView(expense: expense)) {
                            Text("\(expense.merchant ?? "") - ¥\(expense.amountCents ?? 0)")
                        }
                    }
                }
            }
            .navigationBarItems(trailing:
                                    HStack {
                Button(action: viewModel.filterButtonTapped) {
                    Image(systemName: "line.3.horizontal.decrease.circle.fill")
                }
                Menu {
                    Button(action: viewModel.fileButtonTapped) {
                        Text("Create New Group")
                    }
                } label: {
                    Image(systemName: "plus.rectangle.on.folder.fill")
                }
            }
            )
            .navigationTitle("Home")
            .fullScreenCover(isPresented: $viewModel.isFilterShowing) {
                FilterView(isPresentedFilter: $viewModel.isFilterShowing)
            }
            .fullScreenCover(isPresented: $viewModel.isCreatingFileShowing) {
                CreateFileView(isCreatingFilePresented: $viewModel.isCreatingFileShowing)
            }
        }
        .onAppear(perform: viewModel.fecthExpenses)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
