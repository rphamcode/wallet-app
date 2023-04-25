//
//  CardModel.swift
//  wallet-app
//
//  Created by Pham on 4/25/23.
//

import Foundation

class CardModel: ObservableObject {
      @Published var cards = [Card]()
      
//      init() {
//            Card(cardName: "", cardBalance: "", cardColor: .clear, isFirstBlankCard: true)
//            Card(cardName: "John Doe", cardBalance: "1024.87", cardColor: .mint, expenses: [
//                  Expense(amountSpent: "19.99", spentType: "Entertainment", product: "Netflix", productIcon: "Netflix"),
//                  Expense(amountSpent: "9.99", spentType: "Entertainment", product: "Spotify", productIcon: "Spotify"),
//                  Expense(amountSpent: "14.99", spentType: "Entertainment", product: "HBO Max", productIcon: "HBO Max"),
//            ])
//            Card(cardName: "John Doe", cardBalance: "2024.87", cardColor: .cyan, expenses: [
//                  Expense(amountSpent: "75.00", spentType: "Groceries", product: "Whole Foods", productIcon: "Whole Foods"),
//                  Expense(amountSpent: "9.99", spentType: "Entertainment", product: "Patreon", productIcon: "Patreon"),
//                  Expense(amountSpent: "12.99", spentType: "Entertainment", product: "Amazon Prime", productIcon: "Amazon"),
//            ])
//      }
}
