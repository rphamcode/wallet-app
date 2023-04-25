//
//  ExpensesView.swift
//  wallet-app
//
//  Created by Pham on 4/25/23.
//

import SwiftUI

struct ExpensesView: View {
      var expenses: [Expense]
      
      @State private var animateChange: Bool = true
      
    var body: some View {
          VStack(spacing: 18) {
                ForEach(expenses) { expense in
                      HStack(spacing: 12) {
                            Image(expense.productIcon)
                                  .resizable()
                                  .aspectRatio(contentMode: .fit)
                                  .frame(width: 55, height: 55)
                            
                            VStack(alignment: .leading, spacing: 0) {
                                  Text(expense.product)
                                  Text(expense.spentType)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text(expense.amountSpent)
                                  .font(.title3)
                                  .fontWeight(.semibold)
                      }
                }
          }
          .opacity(animateChange ? 1 : 0)
          .offset(y: animateChange ? 0 : 50)
          .onChange(of: expenses) { newValue in
                withAnimation(.easeInOut(duration: 0.1)) {
                      animateChange = false
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                      withAnimation(.easeInOut(duration: 0.25)) {
                            animateChange = true
                      }
                }
          }
    }
}

struct ExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
