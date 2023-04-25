//
//  Expense.swift
//  wallet-app
//
//  Created by Pham on 4/25/23.
//

import Foundation

struct Expense: Identifiable, Equatable, Hashable {
      var id = UUID().uuidString
      var amountSpent: String
      var product: String
      var productIcon: String
      var spentType: String
}
