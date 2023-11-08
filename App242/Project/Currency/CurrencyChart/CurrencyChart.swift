//
//  CurrencyChart.swift
//  App242
//
//  Created by Вячеслав on 11/1/23.
//

import SwiftUI

struct CurrencyChart: View {
    
    @Environment(\.presentationMode) var router
    
    @State var pairs: [String] = ["USDEUR", "USDGBP", "USDJPY"]
    @State var current_pair: String = "USDEUR"
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(current_pair)
                        .foregroundColor(.white)
                        .font(.system(size: 19, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 15, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 15, weight: .regular))
                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                
                HStack {
                    
                    Text("$\(Int.random(in: 1...250500))")
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                    
                    Text("+\(Int.random(in: 1...3))%")
                        .foregroundColor(.black)
                        .font(.system(size: 12, weight: .regular))
                        .padding(5)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                TradeChart(pair: current_pair)
                    .disabled(true)
                
                Menu {
                    
                    ForEach(pairs, id: \.self) { index in
                    
                        Button(action: {
                            
                            current_pair = index
                            
                        }, label: {
                            
                            HStack {
                                
                                Text(index)
                                
                                Spacer()
                                
                                if current_pair == index {
                                    
                                    Image(systemName: "xmark")
                                }
                            }
                        })
                    }
                    
                } label: {
                    
                    HStack {
                        
                        Text(current_pair)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(.black))
                    .padding(.horizontal)
                }
                
                HStack {
                    
                    Button(action: {
                        
                        current_pair = pairs.randomElement() ?? "USDEUR"
                        
                    }, label: {
                        
                        Text("Up")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.green))
                    })
                    
                    Button(action: {
                        
                        current_pair = pairs.randomElement() ?? "USDEUR"
                        
                    }, label: {
                        
                        Text("Down")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.red))
                    })
                }
                .padding([.bottom, .horizontal])
                
                Spacer()
            }
        }
    }
}

#Preview {
    CurrencyChart()
}
