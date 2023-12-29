//
//  RegistrationPasswordViewModel
//  MoviesCatalog
//
//  Created by: Arsentiy
//

import SwiftUI

class RegistrationPasswordViewModel: ObservableObject {
    @Published var password: String = ""
    @Published var confirmPassword: String = ""

    // Additional validation logic as needed

    var arePasswordsValid: Bool {
        // Implement your password validation logic here
        return password == confirmPassword && !password.isEmpty
    }
}
