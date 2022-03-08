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
    @StateObject var viewModel = CardsViewModel()
    @FetchRequest(sortDescriptors: []) var cards: FetchedResults<CreditCard>
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    
                    Pager(page: page,
                          data: cards,
                          content: { card in
                        ZStack {
                            Rectangle()
                                .foregroundColor(.blue)
                                .cornerRadius(20)
                                .shadow(color: .gray, radius: 5, x: 2, y: 2)
                            GeometryReader { cardSize in
                                VStack(spacing: 10) {
                                    Text("Credit Card")
                                        .frame(width: cardSize.size.width - 32, alignment: .trailing)
                                        .font(.title2)
                                        .padding([.top, .leading, .trailing], 16)
                                    Spacer()
                                    Text(card.number ?? "")
                                        .font(.system(size: 20))
                                    Text(card.type ?? "")
                                        .frame(width: cardSize.size.width - 32, alignment: .leading)
                                        .font(.title)
                                        .padding([.bottom, .leading, .trailing], 16)
                                }
                            }
                            
                        }
                    })
                        .onPageChanged({ i in
                            viewModel.pageIndex = i
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
                            viewModel.isAddCardPresented.toggle()
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
                    List {
                        Section("Expenses") {
                            ForEach(cards[viewModel.pageIndex].strongExpenses) { cardExpense in
                                HStack {
                                    Text("\(cardExpense.strongValue)")
                                    Spacer()
                                    Text("\(cardExpense.strongDate)")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                            
                        }
                    }
                    .listStyle(.plain)
                }
                .navigationTitle("Cards")
                .navigationBarItems(trailing: HStack {
                    Button(action: {
                        print("Reload")
                    }, label: {
                        Image(systemName: "arrow.clockwise")
                    })
                    Button {
                        viewModel.isAddExpenseToCard.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                )
            }
            .fullScreenCover(isPresented: $viewModel.isAddCardPresented) {
                AddCard(isPresented: $viewModel.isAddCardPresented)
            }
            .fullScreenCover(isPresented: $viewModel.isAddExpenseToCard) {
                AddCardExpense(isAddCardExpensePresented: $viewModel.isAddExpenseToCard, card: cards[viewModel.pageIndex])
            }
        }
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView()
    }
}
