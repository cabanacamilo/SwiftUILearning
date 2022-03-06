//
//  AddCard.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/03/06.
//

import SwiftUI

struct AddCard: View {
    
    @State var number = ""
    @State var type = ""
    @Binding var isPresented: Bool
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        
        NavigationView {
            VStack (spacing: 20) {
                TextField("Card ID", text: $number)
                    .padding()
                    .font(.system(size: 20))
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 1))
                TextField("Type", text: $type)
                    .padding()
                    .font(.system(size: 20))
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 1))
                Spacer()
                Button("Add Card") {
                    let card = CreditCard(context: moc)
                    card.id = UUID()
                    card.number = number
                    card.type = type
                    try? moc.save()
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 60, alignment: .center)
                .foregroundColor(.white)
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .font(.system(size: 25))
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
            }
            .padding()
            .navigationTitle("Add Card")
            .navigationBarItems(trailing: Button(action: {
                isPresented = false
            }, label: {
                Image(systemName: "xmark")
            }))
        }
        
    }
}

struct AddCard_Previews: PreviewProvider {
    static var previews: some View {
        AddCard(isPresented: .constant(false))
    }
}
