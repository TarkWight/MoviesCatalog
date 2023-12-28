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
            // MARK: First Frame
            HStack {
                backButton
                    .padding(.leading, 15)
                
                Spacer()
                
                Text("FИЛЬМУС")
                    .font(.title2)
                    .bold()
                    .padding(.trailing, 15)
                    .foregroundColor(EnumColors.accent)
                
                Spacer()
            }
            .padding(.top, 15)
            
          // MARK: Second Frame (Label + TextField + Button)
            VStack {
                Text("ВХОД")
                    .font(.title)
                    .padding()

                TextField("Логин", text: $viewModel.username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("Пароль", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Войти") {
                    viewModel.login()
                }
                .padding()
            }
            .padding()

            // MARK: Fifth Frame (Combined Text and Button)
            HStack {
                Text("Еще нет аккаунта?")
                
                Button("Зарегистрируйтесь") {
                    // Используйте метод goToRegistration для перехода на экран регистрации
                    coordinator.goToRegistration()
                }
                .padding()
            }
            .padding()

            Spacer()
        }
        .padding()
        .navigationTitle("Login")
        .navigationBarBackButtonHidden(true)
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
