import SwiftUI

struct ForgotView: View {
    @State private var email: String = ""
    @State private var isEmailSent: Bool = false
    
    var body: some View {
        VStack(spacing: 40) {
            // Title
            Text("Forgot Password")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 120)
            
            // Email Input Field
            VStack(alignment: .leading, spacing: 10) {
                
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .autocapitalization(.none)
            }
            .padding(.horizontal, 40)
            
            // Submit Button
            Button(action: {
                handlePasswordReset()
            }) {
                Text("Send Reset Link")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 40)
            
            // Confirmation Message
            if isEmailSent {
                Text("A password reset link has been sent to your email.")
                    .foregroundColor(.green)
                    .padding(.horizontal, 40)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    /// Simulate email reset action
    private func handlePasswordReset() {
        guard !email.isEmpty else {
            // Perform soft check on email in system
            return
        }
        
        // Simulate sending email
        print("Reset link sent to: \(email)")
        isEmailSent = true
    }
}

#Preview {
    ForgotView()
}
