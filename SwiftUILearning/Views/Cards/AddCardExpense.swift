//
//  AddCardExpense.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/03/08.
//

import SwiftUI

struct AddCardExpense: View {
    
    @Binding var isAddCardExpensePresented: Bool
    @State var date = ""
    @State var value = ""
    @Environment(\.managedObjectContext) var moc
    let card: CreditCard
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Date", text: $date)
                    .padding()
                    .font(.system(size: 20))
                    .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 1))
                TextField("Value", text: $value)
                    .padding()
                    .font(.system(size: 20))
                    .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 1))
                Spacer()
            }
            .padding()
            .navigationTitle("Add Card Exepense")
            .navigationBarItems(leading: Button("Cancel") {
                isAddCardExpensePresented = false
            }
                                ,trailing: Button("Done") {
                let expense = CreditCardExpenses(context: moc)
                expense.id = UUID()
                expense.value = value
                expense.date = date

                expense.card = card
                
                try? moc.save()
            })
        }
        .onAppear {
            print(card.strongId, card.strongType, card.strongNumber)
        }
    }
}

struct AddCardExpense_Previews: PreviewProvider {
    static var previews: some View {
        AddCardExpense(isAddCardExpensePresented: .constant(false), card: CreditCard())
    }
}
