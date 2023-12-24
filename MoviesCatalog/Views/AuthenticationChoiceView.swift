//
//  AuthenticationChoiceView
//  MoviesCatalog
//
//  Created by: Arsentiy
//

import SwiftUI

struct AuthenticationChoiceView: View {
    @ObservedObject var coordinator: AppCoordinator

    var body: some View {
        VStack {
            Text("Welcome! Choose an option:")
                .font(.headline)
                .padding()

            Button("Login") {
                coordinator.showLogin()
            }
            .padding()

            Button("Register") {
                coordinator.showRegistration()
            }
            .padding()
        }
        .navigationTitle("Authentication Choice")
    }
}
