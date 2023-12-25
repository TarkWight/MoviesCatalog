//
//  MainView
//  MoviesCatalog
//
//  Created by: Arsentiy
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    var coordinator: MainCoordinator

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
        MainView(viewModel: MainViewModel(), coordinator: MainCoordinator())
    }
}
