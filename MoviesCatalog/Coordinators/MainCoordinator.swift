//
//  MainCoordinator
//  MoviesCatalog
//
//  Created by: Arsentiy
//

import SwiftUI

class MainCoordinator: ObservableObject {
    @Published var currentScreen: Screen?
    weak var parentCoordinator: AppCoordinator?
    
    func navigateToMovieDetails() {
        // Здесь должна быть ваша логика перехода к деталям фильма
        print("Navigate to Movie Details")
    }
}
