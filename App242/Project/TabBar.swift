//
//  TabBar.swift
//  App242
//
//  Created by Вячеслав on 11/1/23.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 6, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("primary") : Color.gray)
                            .frame(width: 22, height: 22)
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 20)
        .padding(.bottom, 45)
        .background(Color("bg"))
    }
}

enum Tab: String, CaseIterable {
    
    case Budget = "Budget"
    
    case Currency = "Currency"
    
    case Expenses = "Expenses"
    
    case Settings = "Settings"
    
}

#Preview {
    ContentView()
}


