//
//  MainView
//  MoviesCatalog
//
//  Created by: Arsentiy
//

import SwiftUI

struct MainScreenView: View {
    @ObservedObject var viewModel: MainViewModel
    var coordinator: MainScreenCoordinator

    var body: some View {
        VStack {
            Text("Main View")
                .font(.title)
                .padding()

            Button("Navigate to Movie Details") {
                coordinator.navigateToMovieDetails()
            }
            .padding()

            Spacer()

            // Добавьте свою логику отображения данных из MainViewModel
        }
        .padding()
        .navigationTitle("Main")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView(viewModel: MainViewModel(), coordinator: MainScreenCoordinator())
    }
}
