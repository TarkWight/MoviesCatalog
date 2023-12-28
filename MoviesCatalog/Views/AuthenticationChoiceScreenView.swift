//
//  AuthenticationChoiceScreenView
//  MoviesCatalog
//
//  Created by: Arsentiy
//

import SwiftUI


struct AuthenticationChoiceScreenView: View {
    @ObservedObject var coordinator: AppCoordinator
    
    var body: some View {
        ZStack {
            EnumColors.gray
                .ignoresSafeArea()
            VStack {
                
                Text("FИЛЬМУС")
                    .bold()
                    .foregroundColor(EnumColors.accent)
                    .frame(width: 85, height: 21)
                    .padding(.vertical, -100)
                
                Image("authChoiceImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 338, height: 350)
                
                Text("Погрузись в мир кино")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 20)
                
                Text("Мы предлагаем удобный и легкий способ насладиться любимыми фильмами прямо с Вашего мобильного устройства.")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Button("Регистрация") {
                    coordinator.showRegistration()
                }
                .buttonStyle(CustomButtonStyle(color: EnumColors.accent))
                .padding(.vertical, 10)
                
                Button("Войти") {
                    coordinator.showLogin()
                }
                .buttonStyle(CustomButtonStyle(color: EnumColors.getColor(of: .gray, by: 0.1), textColor: EnumColors.accent))
                .padding(.vertical, 10)
            }
            
            .frame(width: 360, height: 700)
            .navigationTitle("Authentication Choice")
            
        }
        .statusBar(hidden: false)
    }
    
}

struct AuthenticationChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationChoiceScreenView(coordinator: AppCoordinator())
    }
}
