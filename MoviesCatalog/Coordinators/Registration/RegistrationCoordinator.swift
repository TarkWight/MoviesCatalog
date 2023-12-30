//
//  RegistrationCoordinator
//  MoviesCatalog
//
//  Created by: Arsentiy
//

import SwiftUI

class RegistrationCoordinator: ObservableObject {
    @Published var currentScreen: Screen?
    weak var parentCoordinator: AppCoordinator?
    
    func goBackToAuthenticationChoice() {
        parentCoordinator?.currentScreen = .authenticationChoice
    }
}
