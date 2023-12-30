//
//  RegistrationPasswordScreenView
//  MoviesCatalog
//
//  Created by: Arsentiy
//

import SwiftUI

struct RegistrationPasswordScreenView: View {
    @ObservedObject var viewModel: RegistrationPasswordViewModel
    var coordinator: RegistrationPasswordCoordinator

    var body: some View {
        ZStack {
            // Your background color or styling
            
            VStack {
                // Your UI components for password entry
                
                Button(action: {
                    // Handle registration completion and navigation to Screen.main
                    coordinator.navigateToMainScreen()
                }) {
                    Text("Зарегистрироваться")
                        .foregroundColor(.white)
                        .padding()
                        .background(viewModel.arePasswordsValid ? ColorsEnum.accent : ColorsEnum.gray)
                        .cornerRadius(8)
                        .opacity(viewModel.arePasswordsValid ? 1.0 : 0.7)
                        .disabled(!viewModel.arePasswordsValid)
                }
                .padding()

                // Additional UI components as needed

            }
            .padding()
            .navigationTitle("Registration Password")
        }
    }
}

struct RegistrationPasswordScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationPasswordScreenView(viewModel: RegistrationPasswordViewModel(), coordinator: RegistrationPasswordCoordinator())
    }
}

