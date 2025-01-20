//
//  LoginView.swift
//  CS4261 ToDoList App
//
//  Created by Yeongbin Kim on 1/19/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To Do List", subtitle: "Get your things done!", background: .blue)
                
                // Login Form
                Form {
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TodoListButton(title: "Login", background: .pink) {
                        // Attempt log in
                    }
                    .padding()
                }
                
                // Create Account
                VStack {
                    Text("Don't have an account?")
                    
                    NavigationLink("Create an account here",
                                   destination: RegisterView())
                }
                .padding(.bottom, 200)
                
                Spacer() // Get things moved up
            }
        }
    }
}

#Preview {
    LoginView()
}
