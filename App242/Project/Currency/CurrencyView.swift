//
//  CurrencyView.swift
//  App242
//
//  Created by Вячеслав on 11/1/23.
//

import SwiftUI

struct CurrencyView: View {
    
    @StateObject var viewModel = CurrencyViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Currency")
                        .foregroundColor(.white)
                        .font(.system(size: 19, weight: .medium))
                    
                    HStack {
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                            
                            CurrencyChart()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            Image(systemName: "chart.line.uptrend.xyaxis")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 15, weight: .regular))
                                .padding(9)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                        })
                    }
                }
                .padding()
                
                HStack {
                    
                    ForEach(["EUR", "GBP", "JPY"], id: \.self) { index in
                    
                        VStack(alignment: .center, spacing: 6, content: {
                            
                            Text(index)
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                            
                            Text("$\(Int.random(in: 1...10))")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .regular))
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 25).fill(.white))
                    }
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 10, content: {
                    
                    Text("Swap")
                        .foregroundColor(.white)
                        .font(.system(size: 19, weight: .medium))
                    
                    VStack {
                        
                        HStack {
                            
                            Text("USD")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .medium))
                            
                            Spacer()
                            
                            Text("\(4236)$")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        }
                        .frame(height: 150)
                        .padding(.horizontal)
                        
                        HStack {
                            
                            Text("EUR")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .medium))
                            
                            Spacer()
                            
                            Text("\(4225)$")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        }
                        .frame(height: 150)
                        .padding(.horizontal)
                        .background(RoundedRectangle(cornerRadius: 25).fill(.white))
                    }
                    .background(RoundedRectangle(cornerRadius: 25).stroke(.white))
                })
                .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    CurrencyView()
}
