//
//  RegistrationCoordinator
//  MoviesCatalog
//
//  Created by: Arsentiy
//

import SwiftUI

class RegistrationCoordinator: ObservableObject {
    @Published var currentScreen: Screen?

    func goBackToAuthenticationChoice() {
        currentScreen = .authenticationChoice
    }
}
