//
//  Card.swift
//  wallet-app
//
//  Created by Pham on 4/25/23.
//

import Foundation
import SwiftUI

struct Card: Identifiable {
      var id: UUID = .init()
      var cardName: String
      var cardColor: Color
      var cardBalance: String
      var expenses: [Expense] = []
      var isFirstBlankCard: Bool = false
}

extension Card: Equatable {
      static func == (lhs: Card, rhs: Card) -> Bool {
            return lhs.id == rhs.id
      }
}

var sampleCards: [Card] = [
    .init(cardName: "", cardColor: .clear, cardBalance: "", isFirstBlankCard: true),
    .init(cardName: "John Doe", cardColor: Color("Card 1"), cardBalance: "$5024.9", expenses: [
        Expense(amountSpent: "$18", product: "Youtube", productIcon: "Youtube", spentType: "Entertainment"),
        Expense(amountSpent: "$128", product: "Amazon", productIcon: "Amazon", spentType: "Shopping"),
        Expense(amountSpent: "$28", product: "Apple", productIcon: "Apple", spentType: "Entertainment"),
    ]),
    .init(cardName: "John Doe", cardColor: Color("Card 2"), cardBalance: "$1439.5", expenses: [
        Expense(amountSpent: "$9", product: "Patreon", productIcon: "Patreon", spentType: "Entertainment"),
        Expense(amountSpent: "$10", product: "Dribbble", productIcon: "Dribbble", spentType: "Entertainment"),
        Expense(amountSpent: "$100", product: "Instagram", productIcon: "Instagram", spentType: "Entertainment"),
    ]),
    .init(cardName: "John Doe", cardColor: Color("Card 3"), cardBalance: "$859.78", expenses: [
        Expense(amountSpent: "$55", product: "Netflix", productIcon: "Netflix", spentType: "Entertainment"),
        Expense(amountSpent: "$348", product: "Photoshop", productIcon: "Photoshop", spentType: "Utilities"),
        Expense(amountSpent: "$99", product: "Figma", productIcon: "Figma", spentType: "Utilities"),
    ]),
]
