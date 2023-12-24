//
//  AppCoordinator
//  MoviesCatalog
//
//  Created by: Arsentiy
//

import SwiftUI

class AppCoordinator: ObservableObject {
    enum AuthenticationStatus {
        case loggedIn
        case firstTimeUser
    }

    @Published var currentScreen: Screen?

    init() {
        checkAuthenticationStatus()
    }

    private func checkAuthenticationStatus() {
        // Логика проверки статуса входа пользователя
        // ...

        // Пример: проверка статуса и установка текущего экрана
        let status: AuthenticationStatus = .firstTimeUser
        setCurrentScreen(for: status)
    }

    private func setCurrentScreen(for status: AuthenticationStatus) {
        switch status {
        case .loggedIn:
            currentScreen = .main
        case .firstTimeUser:
            currentScreen = .authenticationChoice
        }
    }

    func showLogin() {
        currentScreen = .login
    }

    func showRegistration() {
        currentScreen = .registration
    }

    func showMain() {
        currentScreen = .main
    }
}

