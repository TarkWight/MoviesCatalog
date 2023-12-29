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
    @Published var gender: Gender = .male
    
    // Добавлено свойство для форматированной даты
    @Published var formattedBirthDate: String = ""
    
    // Added property to control password visibility
    @Published var isPasswordVisible: Bool = false

    func updateFormattedBirthDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        formattedBirthDate = dateFormatter.string(from: birthDate)
    }
    
    func togglePasswordVisibility() {
        isPasswordVisible.toggle()
    }

    func register() {
        // Логика регистрации
        print("Register with username: \(username), name: \(name), password: \(password), email: \(email), birthDate: \(birthDate)")
    }
}
