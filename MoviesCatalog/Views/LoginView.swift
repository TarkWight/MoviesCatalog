//
//  LoginView
//  MoviesCatalog
//
//  Created by: Arsentiy
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    var coordinator: LoginCoordinator

    var body: some View {
        VStack {
            Text("Login")
                .font(.title)
                .padding()

            TextField("Username", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Login") {
                viewModel.login()
            }
            .padding()

            Spacer()

            Button("Back to Authentication Choice") {
                coordinator.goBackToAuthenticationChoice()
            }
            .padding()
        }
        .padding()
        .navigationTitle("Login")
    }
}
