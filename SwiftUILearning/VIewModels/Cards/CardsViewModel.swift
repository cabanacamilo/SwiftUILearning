//
//  CardsViewModel.swift
//  SwiftUILearning
//
//  Created by Camilo Cabana on 2022/03/02.
//

import Foundation

class CardsViewModel: ObservableObject {
    
    @Published var cards = Card.cards
    @Published var selectedCard: Card = Card.cards[0]
}
