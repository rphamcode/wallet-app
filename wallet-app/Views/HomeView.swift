//
//  HomeView.swift
//  wallet-app
//
//  Created by Pham on 4/25/23.
//

import SwiftUI

struct HomeView: View {
      var proxy: ScrollViewProxy
      var size: CGSize
      var safeArea: EdgeInsets
     
      @State private var activePage: Int = 1
      @State private var myCards: [Card] = sampleCards
    
      @State private var offset: CGFloat = 0
      @State private var isManualAnimating: Bool = false
      
    var body: some View {
          ScrollView(.vertical, showsIndicators: false) {
              VStack(spacing: 10) {
                  ProfileCardView()
                  
                  Capsule()
                      .fill(.gray.opacity(0.2))
                      .frame(width: 50, height: 5)
                      .padding(.vertical, 5)
                  
                  let pageHeight = size.height * 0.65
                 
                  GeometryReader {
                      let proxy = $0.frame(in: .global)
                      
                      TabView(selection: $activePage) {
                            ForEach(myCards) { card in
                              ZStack {
                                  if card.isFirstBlankCard {
                                      Rectangle()
                                          .fill(.clear)
                                  } else {
                                      CardView(card: card)
                                  }
                              }
                              .frame(width: proxy.width - 60)
                              .tag(index(card))
                              .offSetX(activePage == index(card) && !isManualAnimating) { rect in
                                  let minX = rect.minX
                                  let pageOffset = minX - (size.width * CGFloat(index(card)))
                                  offset = pageOffset
                              }
                          }
                      }
                      .tabViewStyle(.page(indexDisplayMode: .never))
                      .background {
                          RoundedRectangle(cornerRadius: 40 * reverseProgress(size), style: .continuous)
                              .fill(Color("ExpandBG").gradient)
                              .frame(height: max(pageHeight + fullScreenHeight(size, pageHeight, safeArea), 0))
                              .frame(width: max(proxy.width - (60 * reverseProgress(size)), 0), height: pageHeight, alignment: .top)
                              .offset(x: -15 * reverseProgress(size))
                              .scaleEffect(0.95 + (0.05 * progress(size)), anchor: .leading)
                              .offset(x: (offset + size.width) < 0 ? (offset + size.width) : 0)
                              .offset(y: (offset + size.width) > 0 ? (-proxy.minY * progress(size)) : 0)
                      }
                  }
                  .frame(height: pageHeight)
                  .zIndex(1000)
                  
                    ExpensesView(expenses: myCards[activePage == 0 ? 1 : activePage].expenses)
                        .padding(.horizontal, 30)
                        .padding(.top, 10)
              }
              .padding(.top, safeArea.top + 15)
              .padding(.bottom, safeArea.bottom + 15)
              .id("CONTENT")
          }
          .scrollDisabled(activePage == 0 || isManualAnimating)
          .overlay(content: {
              if reverseProgress(size) < 0.15 && activePage == 0 {
                  ExpandedView()
                      .scaleEffect(1 - reverseProgress(size))
                      .opacity(1.0 - (reverseProgress(size) / 0.15))
                      .transition(.identity)
              }
          })
          .onChange(of: offset) { newValue in
                if newValue == 0 && activePage == 0 {
                      proxy.scrollTo("CONTENT", anchor: .topLeading)
                }
          }
    }
      
      @ViewBuilder
      func ExpandedView() -> some View {
            VStack(spacing: 15) {
                  VStack(spacing: 30) {
                        HStack(spacing: 12) {
                              Image(systemName: "creditcard.fill")
                                    .font(.title2)
                              
                              Text("Credit Card")
                                    .font(.title3.bold())
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .overlay(alignment: .trailing) {
                              Button {
                                    isManualAnimating = true
                                    withAnimation(.easeInOut(duration: 0.25)) {
                                          activePage = 1
                                          offset = -size.width
                                    }
                              
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                          isManualAnimating = false
                                    }
                              } label: {
                                    Image(systemName: "xmark.circle.fill")
                                          .font(.title)
                                          .foregroundColor(.white.opacity(0.5))
                              }
                        }
                        
                        HStack(spacing: 12) {
                              Image(systemName: "building.columns.fill")
                                    .font(.title2)
                              
                              Text("Open an account")
                                    .font(.title3.bold())
                              
                              Image(systemName: "dollarsign.circle.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                    .padding(.leading, 5)
                              
                              Image(systemName: "eurosign.circle.fill")
                                    .font(.largeTitle)
                                    .foregroundColor(.blue)
                                    .padding(.leading, -25)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                  }
                  .foregroundColor(.white)
                  .padding(25)
                  .background {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                              .fill(Color("ExpandButton"))
                  }
                  
                  Text("Your Card Number")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white.opacity(0.35))
                        .padding(.top, 10)
                        .offset(y: 5)
                  
                  let values: [String] = [
                        "1", "2", "3", "4", "5", "6", "7", "8", "9", "scan", "0", "back"
                  ]
                  
                  GeometryReader {
                        let size = $0.size
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 3), spacing: 0) {
                              ForEach(values, id: \.self) { item in
                                    Button(action: {
                                         
                                    }, label: {
                                          ZStack {
                                                if item == "scan" {
                                                      Image(systemName: "barcode.viewfinder")
                                                            .font(.title.bold())
                                                } else if item == "back" {
                                                      Image(systemName: "delete.backward")
                                                            .font(.title.bold())
                                                } else {
                                                      Text(item)
                                                            .font(.title.bold())
                                                }
                                          }
                                          .foregroundColor(.white)
                                          .contentShape(Rectangle())
                                    })
                                    .frame(width: size.width / 3, height: size.height / 4)
                              }
                        }
                        .padding(.horizontal, -15)
                  }
                  
                  Button {
                        
                  } label: {
                        Text("Add Card")
                              .font(.title2.bold())
                              .foregroundColor(.white)
                              .frame(maxWidth: .infinity)
                              .padding(.vertical, 20)
                              .background {
                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                          .fill(Color("ExpandButton"))
                              }
                  }
            }
            .padding(.horizontal, 15)
            .padding(.top, 15 + safeArea.top)
            .padding(.bottom, 15 + safeArea.bottom)
            .environment(\.colorScheme, .dark)
      }
      
      func index(_ of: Card) -> Int {
            return myCards.firstIndex(of: of) ?? 0
      }
      
      func progress(_ size: CGSize) -> CGFloat {
            let pageOffset = offset + size.width
            let progress = pageOffset / size.width
            
            return min(progress, 1)
      }
      
      func fullScreenHeight(_ size: CGSize, _ pageHeight: CGFloat, _ safeArea: EdgeInsets) -> CGFloat {
            let progress = progress(size)
            let remainingScreenHeight = progress * (size.height - (pageHeight - safeArea.top - safeArea.bottom))
            
            return remainingScreenHeight
      }
      
      func reverseProgress(_ size: CGSize) -> CGFloat {
            let progress = 1 - progress(size)
            return max(progress, 0)
      }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
