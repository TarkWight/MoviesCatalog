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
            AuthenticationChoiceScreenView(coordinator: appCoordinator)
        case .login:
            LoginScreenView(viewModel: LoginViewModel(), coordinator: appCoordinator.loginCoordinator)
        case .registration:
            RegistrationScreenView(viewModel: RegistrationViewModel(), coordinator: appCoordinator.registrationCoordinator)
        case .main:
            MainScreenView(viewModel: MainViewModel(), coordinator: appCoordinator.mainCoordinator)
        case nil:
            Text("Loading...")
        }
    }
}



