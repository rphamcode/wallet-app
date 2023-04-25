//
//  ViewExtension.swift
//  wallet-app
//
//  Created by Pham on 4/25/23.
//

import Foundation
import SwiftUI

extension View {
      @ViewBuilder
      func offSetX(_ addObserver: Bool, completion: @escaping (CGRect) -> ()) -> some View {
            self
                  .frame(maxWidth: .infinity)
                  .overlay {
                        if addObserver {
                              GeometryReader {
                                    let rect = $0.frame(in: .global)
                                    
                                    Color.clear
                                          .preference(key: OffsetKey.self, value: rect)
                                          .onPreferenceChange(OffsetKey.self, perform: completion)
                              }
                        }
                  }
      }
}
