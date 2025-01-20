//
//  HeaderView.swift
//  CS4261 ToDoList App
//
//  Created by Yeongbin Kim on 1/19/25.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .frame(height: 500)
                .offset(y: -75) // Move blue a little bit up
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
            .padding(.top, -40)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", background: .blue)
}
