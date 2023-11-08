//
//  BudgetView.swift
//  App242
//
//  Created by Вячеслав on 11/1/23.
//

import SwiftUI

struct BudgetView: View {
    
    @StateObject var viewModel = ExpensesViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Travel budget")
                    .foregroundColor(.white)
                    .font(.system(size: 19, weight: .medium))
                    .padding()
                
                VStack(alignment: .leading, spacing: 25, content: {
                    
                    Text("Your's budget")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                    
                    Text("$\(10000)")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .bold))
                    
                    Text("Add (not available)")
                        .foregroundColor(Color(red: 1/255, green: 76/255, blue: 230/255))
                        .font(.system(size: 13, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        .opacity(0.6)
                })
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color(red: 1/255, green: 76/255, blue: 230/255)))
                .padding(.horizontal)
                
                Text("Category")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                VStack {
                    
                    if viewModel.expenses.isEmpty {
                        
                        VStack(alignment: .center, spacing: 6, content: {
                            
                            Text("No category yet")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .medium))
                                .multilineTextAlignment(.center)
                            
                            Text("This will show the budget plan by category")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .multilineTextAlignment(.center)
                        })
                        .frame(maxHeight: .infinity, alignment: .center)
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.expenses, id: \.self) { index in
                                
                                    HStack {
                                        
                                        Image(index.category ?? "")
                                            .renderingMode(.template)
                                            .foregroundColor(.white)
                                            .frame(width: 44, height: 44)
                                            .background(Circle().fill(Color("bg")))
                                        
                                        Text(index.name ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .regular))
                                        
                                        Spacer()
                                        
                                        Text("$\(index.cost)")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .semibold))
                                    }
                                }
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
                .background(RoundedRectangle(cornerRadius: 25).fill(.white).ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
        .onAppear {
            
            viewModel.fetchExpenses()
        }
    }
}

#Preview {
    BudgetView()
}
