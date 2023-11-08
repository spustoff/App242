//
//  ExpensesAdd.swift
//  App242
//
//  Created by Вячеслав on 11/1/23.
//

import SwiftUI

struct ExpensesAdd: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel: ExpensesViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New Expense")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                                .padding(7)
                                .background(Circle().fill(.gray.opacity(0.2)))
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.addExpense(completion: {
                                
                                viewModel.name = ""
                                viewModel.cost = ""
                                viewModel.category = ""
                                
                                router.wrappedValue.dismiss()
                                
                                viewModel.fetchExpenses()
                            })
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 16, weight: .medium))
                        })
                        .opacity(viewModel.name.isEmpty || viewModel.cost.isEmpty || viewModel.category.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.name.isEmpty || viewModel.cost.isEmpty || viewModel.category.isEmpty ? true : false)
                    }
                }
                .padding()
                .padding(.vertical)
                
                VStack(alignment: .leading, spacing: 10, content: {
                    
                    Text("Name")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Stabucks...")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                            .opacity(viewModel.name.isEmpty ? 1 : 0)
                            
                        TextField("", text: $viewModel.name)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .regular))
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                })
                .padding(.horizontal)
                .padding(.bottom)
                
                VStack(alignment: .leading, spacing: 10, content: {
                    
                    Text("Cost")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("100$...")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                            .opacity(viewModel.cost.isEmpty ? 1 : 0)
                            
                        TextField("", text: $viewModel.cost)
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .regular))
                            .keyboardType(.decimalPad)
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                })
                .padding(.horizontal)
                .padding(.bottom)
                
                VStack(alignment: .leading, spacing: 10, content: {
                    
                    Text("Category")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                    
                    HStack {
                        
                        ForEach(viewModel.categories, id: \.self) { index in
                        
                            VStack(spacing: 7) {
                                
                                Image(index)
                                    .renderingMode(.template)
                                    .foregroundColor(.white)
                                    .frame(width: 55, height: 55)
                                    .background(Circle().fill(.gray.opacity(viewModel.category == index ? 0.4 : 0.15)))
                                
                                Text(index.uppercased())
                                    .foregroundColor(viewModel.category == index ? Color("primary") : .white)
                                    .font(.system(size: 13, weight: .regular))
                            }
                            .onTapGesture {
                                
                                viewModel.category = index
                            }
                        }
                        
                        Spacer()
                    }
                })
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ExpensesAdd(viewModel: ExpensesViewModel())
}
