//
//  RegistrationView
//  MoviesCatalog
//
//  Created by: Arsentiy
//

import SwiftUI

struct RegistrationView: View {
    @ObservedObject var viewModel: RegistrationViewModel
    var coordinator: RegistrationCoordinator

    var body: some View {
        VStack {
            Text("Registration")
                .font(.title)
                .padding()

            TextField("Username", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Name", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            DatePicker("Birth Date", selection: $viewModel.birthDate, displayedComponents: .date)
                .datePickerStyle(WheelDatePickerStyle())
                .padding()

            Button("Register") {
                viewModel.register()
            }
            .padding()

            Spacer()

            Button("Back to Authentication Choice") {
                coordinator.goBackToAuthenticationChoice()
            }
            .padding()
        }
        .padding()
        .navigationTitle("Registration")
    }
}

