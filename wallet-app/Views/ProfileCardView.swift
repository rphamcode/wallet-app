//
//  ProfileCardView.swift
//  wallet-app
//
//  Created by Pham on 4/25/23.
//

import SwiftUI

struct ProfileCardView: View {
      var body: some View {
            HStack(spacing: 4) {
                  Text("Hello")
                        .font(.title)
                  
                  Text("John 🤑")
                        .font(.title)
                  
                  Spacer(minLength: 0)
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 35)
            .background {
                  RoundedRectangle(cornerRadius: 35, style: .continuous)
                        .fill(.indigo)
            }
            .padding(.horizontal, 30)
      }
}

struct ProfileCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
