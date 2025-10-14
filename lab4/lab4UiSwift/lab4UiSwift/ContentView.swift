//
//  ContentView.swift
//  lab4UiSwift
//
//  Created by MacBook on 10.10.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
        
            
        }
        VStack{
            Image("logo")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .cornerRadius(100)
            Text("Name")
                .font(.custom("Arial", size: 40))
        }
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
