import SwiftUI

struct LoginView: View {
    @StateObject private var loginVM = LoginViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                // Centered Logo
                Image("FullLogo_Transparent")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .padding(.top, 80)
                
                // Input Fields
                VStack(spacing: 20) {
                    TextField("Username", text: $loginVM.username)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $loginVM.password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                .padding(.horizontal, 40)
                
                // Display error message if username or password is empty
                if let errorMessage = loginVM.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.horizontal, 40)
                }
                
                // Buttons
                VStack(spacing: 15) {
                    // Submit Button
                    Button(action: loginVM.login) {
                        Text("Submit")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    
                    // Loading Spinner while logging in
                    if loginVM.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                            .scaleEffect(1.5)
                            .padding(.top, 20)
                    }
                    
                    // Forgot Password Button (Same Style)
                    NavigationLink(value: "ForgotPassword") {
                        Text("Forgot your password?")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.blue)
                            .background(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                            .cornerRadius(8)
                    }
                }
                .padding(.horizontal, 40)

                // Navigation Destinations
                .navigationDestination(isPresented: $loginVM.isAuthenticated) {
                    MapView()
                }
                .navigationDestination(for: String.self) { route in
                    if route == "ForgotPassword" {
                        ForgotView()
                    }
                }
                
                Spacer()
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    LoginView()
}
