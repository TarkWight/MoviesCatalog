//
//  Coordinator
//  MoviesCatalog
//
//  Created by: Arsentiy
//

import SwiftUI

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
