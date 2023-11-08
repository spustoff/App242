//
//  SettingsView.swift
//  App242
//
//  Created by Вячеслав on 11/1/23.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.system(size: 19, weight: .medium))
                    .padding()
                
                VStack {
                    
                    Text("No members yet")
                        .foregroundColor(.black)
                        .font(.system(size: 23, weight: .semibold))
                        .padding(.top, 200)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://docs.google.com/document/d/1Nr_wK4h70DVYiNKPbEJcHtIHJK8bA3frfDjXk9YJHXQ/edit?usp=sharing") else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        HStack {
                            
                            Text("Usage Policy")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.15)))
                    })
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        HStack {
                            
                            Text("Rate Us")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .regular))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.15)))
                    })
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 25).fill(.white).ignoresSafeArea())
            }
        }
    }
}

#Preview {
    SettingsView()
}
