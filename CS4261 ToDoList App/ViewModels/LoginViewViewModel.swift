//
//  LoginViewViewModel.swift
//  CS4261 ToDoList App
//
//  Created by Yeongbin Kim on 1/19/25.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        // Try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func validate() -> Bool {
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill in all fields."
            
            return false
        }
        
        // email format
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            
            return false
        }
        
        return true
    }
}
