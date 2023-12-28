//
//  LoginCoordinator
//  MoviesCatalog
//
//  Created by: Arsentiy
//

import SwiftUI

class LoginCoordinator: ObservableObject {
    @Published var currentScreen: Screen?
    weak var parentCoordinator: AppCoordinator?

    func goBackToAuthenticationChoice() {
        parentCoordinator?.currentScreen = .authenticationChoice
    }

    func goToRegistration() {
        NotificationCenter.default.post(name: NSNotification.Name("ShowRegistration"), object: nil)
    }
}
