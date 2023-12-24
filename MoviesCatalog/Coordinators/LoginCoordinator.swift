//
//  LoginCoordinator
//  MoviesCatalog
//
//  Created by: Arsentiy
//

import SwiftUI

class LoginCoordinator: ObservableObject {
    @Published var currentScreen: Screen?

    func goBackToAuthenticationChoice() {
        currentScreen = .authenticationChoice
    }
}
