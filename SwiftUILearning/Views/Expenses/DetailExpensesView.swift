//
//  DetailExpensesView.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/02/14.
//

import SwiftUI

struct DetailExpensesView: View {
    @State var expense: Expense
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(expense.merchant ?? "")
                .font(.title)
            Text("¥\(expense.amountCents ?? 0)")
            Text(expense.status ?? "")
            Text(expense.paymentMethod ?? "")
            Spacer()
        }
    }
}

struct DetailExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        DetailExpensesView(expense: Expense())
    }
}
