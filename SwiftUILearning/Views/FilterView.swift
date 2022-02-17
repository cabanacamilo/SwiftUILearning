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
    @State var expensesType = 0
    @State var fromDate = Date()
    @State var toDate = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Show Expenses Type")
                            .padding(.bottom, 10)
                        Picker("Show Expenses Type", selection: $expensesType) {
                            Text("Approver").tag(0)
                            Text("My Expenses").tag(1)
                        }
                        .pickerStyle(.segmented)
                        Text("Expenses Status")
                            .padding([.bottom, .top], 10)
                        ForEach(Filter.testExpensesStatus) { item in
                            Text("   \(item.status)")
                                .font(.system(size: 15))
                                .frame(maxWidth: .infinity, minHeight: 30, alignment: .leading)
                                .background(.white)
                            Spacer()
                        }
                        Text("Expenses Date")
                            .padding([.bottom, .top], 10)
                        HStack (spacing: 10) {
                            Image(systemName: "calendar")
                            DatePicker(selection: $fromDate, in: ...Date(), displayedComponents: .date) {
                                
                            }
                            DatePicker(selection: $toDate, in: ...Date(), displayedComponents: .date) {
                                
                            }
                        }
                    }
                    .padding()
                }
                .background(Color(.systemGroupedBackground))
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
        }
    }
    
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(isPresentedFilter: .constant(false))
    }
}
