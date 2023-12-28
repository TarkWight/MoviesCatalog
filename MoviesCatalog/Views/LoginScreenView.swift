//
//  LoginScreenView
//  MoviesCatalog
//
//  Created by: Arsentiy
//

import SwiftUI

struct LoginScreenView: View {
    @ObservedObject var viewModel: LoginViewModel
    @ObservedObject var coordinator: LoginCoordinator

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
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }

    private var backButton: some View {
        Button(action: {
            coordinator.goBackToAuthenticationChoice()
        }) {
            Image(systemName: "chevron.left")
                .font(.title2)
                .foregroundColor(.blue)
        }
    }
}

struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView(viewModel: LoginViewModel(), coordinator: LoginCoordinator())
    }
}
