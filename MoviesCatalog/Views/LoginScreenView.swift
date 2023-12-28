//  LoginScreenView.swift
//  MoviesCatalog
//
//  Created by: Arsentiy
//

import SwiftUI

struct LoginScreenView: View {
    @ObservedObject var viewModel: LoginViewModel
    @ObservedObject var coordinator: LoginCoordinator
    
    @State private var isPasswordVisible = false
    
    private let appTitle = "FИЛЬМУС"
    
    var body: some View {
        ZStack {
            EnumColors.gray
                .ignoresSafeArea()
            VStack {
                createTopBlock()
                createMiddleBlock()
                Spacer()
                createBottomBlock()
            }
        }
    }
    
    // MARK: Top block
    private func createTopBlock() -> some View {
        HStack {
            backButton
                .padding(.leading, 15)
            
            Spacer()
            
            Text(appTitle)
                .font(.title2)
                .bold()
                .padding(.trailing, 15)
                .foregroundColor(EnumColors.accent)
            
            Spacer()
        }
        .padding(.leading, 15)
    }
    
    // MARK: Middle Block
    private func createMiddleBlock() -> some View {
        VStack {
            Text("ВХОД")
                .font(.title)
                .bold()
                .padding()
                .foregroundColor(.white)
            
            Text("Логин")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Введите логин", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Пароль")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ZStack(alignment: .trailing) {
                if isPasswordVisible {
                    TextField("Введите пароль", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                } else {
                    SecureField("Введите пароль", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                        .foregroundColor(EnumColors.getColor(of: EnumColors.gray, by: 0.45))
                }
                .padding(.trailing, 8)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Button("Войти") {
                viewModel.login()
            }
            .buttonStyle(CustomButtonStyle(color: EnumColors.accent, textColor: .white))
            .padding(.vertical, 20)
            .disabled(!areCredentialsValid())
            .opacity(areCredentialsValid() ? 1.0 : 0.5)
        }
        .padding()
    }
    
    // MARK: Bottom Block
    private func createBottomBlock() -> some View {
        HStack {
            Text("Еще нет аккаунта?")
                .foregroundColor(.white)
            
            Button("Зарегистрируйтесь") {
                coordinator.goToRegistration()
            }
            .foregroundColor(EnumColors.accent)
            .padding()
        }
        .padding()
    }
    // MARK: BackButton
    private var backButton: some View {
        Button(action: {
            coordinator.goBackToAuthenticationChoice()
        }) {
            Image(systemName: "chevron.left")
                .font(.title2)
                .foregroundColor(.white)
        }
    }
    
    private func areCredentialsValid() -> Bool {
        return !viewModel.username.isEmpty && !viewModel.password.isEmpty
    }
}

struct LoginScreenViewPreview: PreviewProvider {
    static var previews: some View {
        LoginScreenView(viewModel: LoginViewModel(), coordinator: LoginCoordinator())
    }
}


