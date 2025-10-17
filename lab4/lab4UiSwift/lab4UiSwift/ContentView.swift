//
//  ContentView.swift
//  lab4UiSwift
//
//  Created by MacBook on 10.10.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var isEditing: Bool = false
    @State private var profileImage: Image = Image("logo")
    @State private var name: String = "Солтис Олександр"
    @State private var description: String = "Студент, що вивчає розробку на SwiftUI. Цікавлюся створенням інтуїтивно зрозумілих та красивих інтерфейсів."
    
    var body: some View {
        ZStack{
            Color(red: 0.1, green: 0.1, blue: 0.2)
                .ignoresSafeArea()
            
            GeometryReader { geo in
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.pink, .purple]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: geo.size.width * 0.8)
                    .blur(radius: geo.size.width * 0.2)
                    .offset(x: -geo.size.width * 0.25, y: geo.size.height * 0.2)
                
                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [.blue, .cyan.opacity(0.8)]),
                            center: .center,
                            startRadius: 10,
                            endRadius: geo.size.width * 0.4
                        )
                    )
                    .frame(width: geo.size.width * 0.7)
                    .blur(radius: geo.size.width * 0.15)
                    .offset(x: geo.size.width * 0.25, y: geo.size.height * 0.55)
                
                Ellipse()
                    .fill(Color.green)
                    .frame(width: geo.size.width * 0.6, height: geo.size.height * 0.3)
                    .blur(radius: geo.size.width * 0.09 )
                    .offset(x: geo.size.width * 0.3, y: geo.size.height * 0.1)
            }.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 25) {
                    
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                    
                    if isEditing {
                        TextField("Ваше ім'я", text: $name)
                            .font(.custom("Arial", size: 30))
                            .bold()
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding()
                            .background(Color.black.opacity(0.2))
                            .cornerRadius(15)
                    } else {
                        Text(name)
                            .foregroundColor(.white)
                            .font(.custom("Arial", size: 30))
                            .bold()
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Про мене")
                            .font(.title2).bold()
                            .foregroundColor(.white.opacity(0.9))
                        
                        if isEditing {
                            TextEditor(text: $description)
                                .frame(minHeight: 150)
                                .font(.body)
                                .padding()
                                .background(Color.black.opacity(0.3))
                                .cornerRadius(15)
                                .colorScheme(.dark)
                        } else {
                            Text(description)
                                .font(.body)
                                .foregroundColor(.white.opacity(0.7))
                        }
                    }
                    .padding()
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(20)
                    
                }
                .padding(40)
            }
            .padding(.horizontal)
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isEditing.toggle()
                    }) {
                        Image(systemName: isEditing ? "checkmark.circle.fill" : "pencil.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(isEditing ? .green : .white)
                            .padding()
                            .shadow(radius: 5)
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
