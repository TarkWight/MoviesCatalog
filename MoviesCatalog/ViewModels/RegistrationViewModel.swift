//
//  RegistrationViewModel
//  MoviesCatalog
//
//  Created by: Arsentiy
//

import SwiftUI

class RegistrationViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var name: String = ""
    @Published var password: String = ""
    @Published var email: String = ""
    @Published var birthDate: Date = Date()

    func register() {
        // Логика регистрации
        print("Register with username: \(username), name: \(name), password: \(password), email: \(email), birthDate: \(birthDate)")
    }
}
