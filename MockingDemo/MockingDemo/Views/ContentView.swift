//
//  ContentView.swift
//  MockingDemo
//
//  Created by Swapnil Magar on 13/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var loginVM = LoginViewModel(service: Webservice())
    @State private var message: String = ""
    
    var errorMessage: String {
        switch loginVM.loginStatus {
        case .denied:
            "Invalid credentials"
        case .validationFailed:
            "Required fields are missing"
        default:
            ""
        }
    }
    
    var body: some View {
        
        let _ = Self._printChanges()
        
        NavigationView {
            VStack {
                Form {
                    TextField("User name", text: $loginVM.username)
                        .accessibilityIdentifier("usernameTextField")
                    
                    TextField("Password", text: $loginVM.password)
                        .accessibilityIdentifier("passwordTextField")
                    
                    HStack {
                        Spacer()
                        Button {
                            loginVM.login()
                        } label: {
                            Text("Login")
                                .accessibilityIdentifier("loginButton")
                        }
                        Spacer()
                    }
                    
                    Text(errorMessage)
                        .accessibilityIdentifier("messageText")
                }
            }
            
            NavigationLink(isActive: .constant(loginVM.loginStatus == .authenticated)) {
                DashboardView()
            } label: {
                EmptyView()
            }

        }
    }
}

#Preview {
    ContentView()
}
