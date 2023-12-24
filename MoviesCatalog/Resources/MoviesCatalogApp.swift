//
//  MoviesCatalogApp.swift
//  MoviesCatalog
//
//  Created by Arsentiy on 15.12.2023.
//

import SwiftUI

@main
struct MoviesCatalogApp: App {

   @StateObject private var appCoordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
