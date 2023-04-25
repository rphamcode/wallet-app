//
//  OffsetReader.swift
//  wallet-app
//
//  Created by Pham on 4/25/23.
//

import Foundation
import SwiftUI

struct OffsetKey: PreferenceKey {
      static var defaultValue: CGRect = .zero
      
      static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
            value = nextValue()
      }
}
