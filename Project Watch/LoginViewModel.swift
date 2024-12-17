import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isAuthenticated: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil // New error message property
   
    func login() {
        // Reset error message on each new login attempt
        self.errorMessage = nil
        
        // Set loading state to true when the login process starts
        self.isLoading = true
        
        // Check if username and password are entered
        if username.isEmpty || password.isEmpty {
            self.errorMessage = "Username or Password not entered"
            self.isLoading = false
            return
        }
        
        print("Logging in with username: \(username), password: \(password)")
        
        // Simulate API call
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if !self.username.isEmpty && !self.password.isEmpty {
                self.isAuthenticated = true
            } else {
                print("Invalid credentials")
            }
            self.isLoading = false
        }
    }
}
