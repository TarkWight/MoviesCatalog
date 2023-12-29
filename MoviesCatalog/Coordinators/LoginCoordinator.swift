//
//  LoginCoordinator
//  MoviesCatalog
//
//  Created by: Arsentiy
//


import SwiftUI

extension Notification.Name {
    static let showRegistration = Notification.Name("ShowRegistration")
}

class LoginCoordinator: ObservableObject {
    @Published var currentScreen: Screen?
    weak var parentCoordinator: AppCoordinator?

    func goBackToAuthenticationChoice() {
        parentCoordinator?.currentScreen = .authenticationChoice
    }

    func goToRegistration() {
        do {
            try navigateToRegistration()
        } catch {
            print("Failed to navigate to registration: \(error)")
        }
    }

    private func navigateToRegistration() throws {
        NotificationCenter.default.post(name: .showRegistration, object: nil)
    }
}

