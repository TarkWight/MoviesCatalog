//
//  ContentView.swift
//  MoviesCatalog
//
//  Created by Arsentiy on 15.12.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var appCoordinator = AppCoordinator()

    var body: some View {
        switch appCoordinator.currentScreen {
        case .authenticationChoice:
            AuthenticationChoiceView(coordinator: appCoordinator)
        case .login:
            LoginView(viewModel: LoginViewModel(), coordinator: LoginCoordinator())
        case .registration:
            RegistrationView(viewModel: RegistrationViewModel(), coordinator: RegistrationCoordinator())
        case .main:
            MainView(viewModel: MainViewModel(), coordinator: MainCoordinator())
        case nil:
            Text("Loading...")
        }
    }
}


