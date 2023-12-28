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

    // Использую ленивые свойства для создания координаторов
    lazy var loginCoordinator: LoginCoordinator = {
        let coordinator = LoginCoordinator()
        coordinator.parentCoordinator = self
        return coordinator
    }()

    lazy var registrationCoordinator: RegistrationCoordinator = {
        let coordinator = RegistrationCoordinator()
        coordinator.parentCoordinator = self
        return coordinator
    }()

    lazy var mainCoordinator: MainCoordinator = {
        let coordinator = MainCoordinator()
        coordinator.parentCoordinator = self
        return coordinator
    }()

    init() {
        checkAuthenticationStatus()
        NotificationCenter.default.addObserver(self, selector: #selector(handleShowRegistration), name: NSNotification.Name("ShowRegistration"), object: nil)

    }

    deinit {
            NotificationCenter.default.removeObserver(self)
        }
    
    
    @objc func handleShowRegistration() {
            showRegistration()
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



