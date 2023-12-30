//
//  RegistrationPasswordCoordinator
//  MoviesCatalog
//
//  Created by: Arsentiy
//

import SwiftUI

class RegistrationPasswordCoordinator: ObservableObject {
    @Published var currentScreen: Screen?
    weak var parentCoordinator: AppCoordinator?

    func navigateToMainScreen() {
        parentCoordinator?.currentScreen = .main
    }
}
