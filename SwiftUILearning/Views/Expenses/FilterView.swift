//
//  FilterView.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/02/17.
//

import SwiftUI

struct FilterView: View {
    
    @StateObject var viewModel = FilterViewModel()
    @Binding var isPresentedFilter: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Show Expenses Type")
                            .padding(.bottom, 10)
                        Picker("Show Expenses Type", selection: $viewModel.expensesType) {
                            Text("Approver").tag(ExpensesType.approver)
                            Text("My Expenses").tag(ExpensesType.myExpenses)
                        }
                        .pickerStyle(.segmented)
                        .onChange(of: viewModel.expensesType) { _ in
                            viewModel.expensesTypeHasSelected()
                        }.onAppear {
                            viewModel.expensesTypeHasSelected()
                        }
                        Text("Expenses Status")
                            .padding([.bottom, .top], 10)
                        ForEach(viewModel.expensesStatusList) { item in
                            switch viewModel.expensesType {
                            case .approver:
                                if viewModel.approverExpenseStatus.id != item.id {
                                    Text("   \(item.status)")
                                        .font(.system(size: 15))
                                        .frame(maxWidth: .infinity, minHeight: 30, alignment: .leading)
                                        .background(.white)
                                        .onTapGesture {
                                            viewModel.expensesStatusHasSelected(item)
                                        }
                                    Spacer()
                                } else {
                                    Text("   \(item.status)")
                                        .font(.system(size: 15))
                                        .frame(maxWidth: .infinity, minHeight: 30, alignment: .leading)
                                        .background(.blue)
                                        .onTapGesture {
                                            viewModel.expensesStatusHasSelected(item)
                                        }
                                    Spacer()
                                }
                            case .myExpenses:
                                if viewModel.myExpenseStatus.id != item.id {
                                    Text("   \(item.status)")
                                        .font(.system(size: 15))
                                        .frame(maxWidth: .infinity, minHeight: 30, alignment: .leading)
                                        .background(.white)
                                        .onTapGesture {
                                            viewModel.expensesStatusHasSelected(item)
                                        }
                                    Spacer()
                                } else {
                                    Text("   \(item.status)")
                                        .font(.system(size: 15))
                                        .frame(maxWidth: .infinity, minHeight: 30, alignment: .leading)
                                        .background(.blue)
                                        .onTapGesture {
                                            viewModel.expensesStatusHasSelected(item)
                                        }
                                    Spacer()
                                }
                            }
                        }
                        Text("Expenses Date")
                            .padding([.bottom, .top], 10)
                        HStack (spacing: 10) {
                            Image(systemName: "calendar")
                            DatePicker(selection: $viewModel.fromDate, in: ...Date(), displayedComponents: .date) {
                                
                            }
                            DatePicker(selection: $viewModel.toDate, in: ...Date(), displayedComponents: .date) {
                                
                            }
                        }
                    }
                    .padding()
                }
                Button("Filter by conditions") {
                    
                }
                .padding()
                .background(.blue)
                .cornerRadius(10)
                .foregroundColor(.white)
                Spacer()
            }
            
            .navigationTitle("Filter")
            .navigationBarItems(trailing:
                                    HStack {
                Button("Reset") {
                    
                }
                Button(action: {
                    isPresentedFilter = false
                }, label: {
                    Image(systemName: "xmark")
                })
            })
            .background(Color(.systemGroupedBackground))
        }
    }
    
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(isPresentedFilter: .constant(false))
    }
}
