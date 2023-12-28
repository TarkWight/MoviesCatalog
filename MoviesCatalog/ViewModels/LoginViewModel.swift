//
//  LoginViewModel
//  MoviesCatalog
//
//  Created by: Arsentiy
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""

    func login() {
        print("Login with username: \(username), password: \(password)")
    }
}
