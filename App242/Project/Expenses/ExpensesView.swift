//
//  ExpensesView.swift
//  App242
//
//  Created by Вячеслав on 11/1/23.
//

import SwiftUI

struct ExpensesView: View {
    
    @StateObject var viewModel = ExpensesViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Expenses")
                    .foregroundColor(.white)
                    .font(.system(size: 19, weight: .medium))
                    .padding()
                
                VStack(alignment: .leading, spacing: 25, content: {
                    
                    Text("Total Expenses")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                    
                    Text("$\(viewModel.expenses.map(\.cost).reduce(0, +))")
                        .foregroundColor(.black)
                        .font(.system(size: 25, weight: .bold))
                })
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    
                    Text("Today")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                        .padding(.bottom)
                    
                    if viewModel.expenses.isEmpty {
                        
                        VStack(alignment: .center, spacing: 10, content: {
                            
                            Text("No expenses yet")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
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
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.isAdd = true
                        
                    }, label: {
                        
                        Text("New")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
                    })
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 25).fill(.white).ignoresSafeArea())
            }
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            ExpensesAdd(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchExpenses()
        }
    }
}

#Preview {
    ExpensesView()
}
