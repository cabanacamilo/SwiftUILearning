//
//  CardsView.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/02/24.
//

import SwiftUI
import SwiftUIPager

struct CardsView: View {
    
    @StateObject var page: Page = .first()
    var colors: [Color] = [.yellow, .blue, .red]
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    Pager(page: page,
                          data: colors,
                          id: \.self,
                          content: { color in
                        
                        Rectangle()
                            .foregroundColor(color)
                            .cornerRadius(20)
                            .shadow(color: .gray, radius: 5, x: 2, y: 2)
                    })
                        .sensitivity(.high)
                        .itemSpacing(20)
                        .alignment(.center)
                        .horizontal(.leftToRight)
                        .interactive(scale: 0.8)
                        .interactive(opacity: 0.5)
                        .preferredItemSize(CGSize(width: geometry.size.width * 0.8, height: geometry.size.height * 0.25))
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.3, alignment: .center)
                    HStack(spacing: geometry.size.width * 0.2) {
                        Button {
                            print("Add Credit Card")
                        } label: {
                            Image(systemName: "creditcard")
                        }
                        .frame(width: 70, height: 70, alignment: .center)
                        .background(Color(.lightGray))
                        .clipShape(Circle())
                        .tint(.white)
                        .font(.title)
                        Button  {
                            print("Freeze")
                        } label: {
                            Image(systemName: "lock")
                        }
                        .frame(width: 70, height: 70, alignment: .center)
                        .background(Color(.lightGray))
                        .clipShape(Circle())
                        .tint(.white)
                        .font(.title)
                    }
                    List(0..<10) { item in
                        Text("Expense \(item)")
                    }
                    .listStyle(.plain)
                }
                .navigationTitle("Cards")
                .navigationBarItems(trailing: Button(action: {
                    print("Reload")
                }, label: {
                    Image(systemName: "arrow.clockwise")
                }))
            }
            
        }
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}
