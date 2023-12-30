//
//  RegistrationScreenView
//  MoviesCatalog
//
//  Created by: Arsentiy
//

import SwiftUI

struct RegistrationScreenView: View {
    @ObservedObject var viewModel: RegistrationViewModel
    var coordinator: RegistrationCoordinator

    @State private var isDatePickerPresented = false

    var body: some View {
        ZStack {
            ColorsEnum.gray
                .ignoresSafeArea()

            VStack {
                // MARK: Title Block
                VStack {
                    ZStack {
                        
                        HStack {
                            backButton
                                .padding(.leading, 15)
                            Spacer()
                            Text("Регистрация")
                                .font(.title)
                                .foregroundColor(ColorsEnum.accent)
                                .padding()
                            Spacer()
                        }
                    }
                    
                }

                // MARK: Input Fields Block
                VStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Имя")
                            .foregroundColor(.white)
                        TextField("Введите имя", text: $viewModel.username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                    }
                    
                    // MARK: Gender Picker
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Пол")
                            .foregroundColor(.white)
                        Picker("", selection: $viewModel.gender) {
                            ForEach(Gender.allCases, id: \.self) { gender in
                                Text(gender == .male ? "Мужчина" : "Женщина")
                                    .foregroundStyle(ColorsEnum.gray)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding()
                    }

                    VStack(alignment: .leading, spacing: 5) {
                        Text("Логин")
                            .foregroundColor(.white)
                        TextField("Введите лонин", text: $viewModel.name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                    }

                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Электронная почта")
                            .foregroundColor(.white)
                        TextField("Введите электронную почту", text: $viewModel.email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                    }

                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Дата рождения")
                                .foregroundColor(.white)
                            TextField("Выберите дату рождения", text: $viewModel.formattedBirthDate)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                                .onTapGesture {
                                    hideKeyboard()
                                    isDatePickerPresented.toggle()
                                }
                                .disabled(isDatePickerPresented)
                        }

                        Button(action: {
                            hideKeyboard()
                            isDatePickerPresented.toggle()
                        }) {
                            Image(systemName: "calendar")
                                .foregroundColor(.white)
                        }
                    }
                }

                // MARK: Register Button Block
                Button("Продолжить") {
                    viewModel.register()
                }
                .buttonStyle(CustomButtonStyle(color: ColorsEnum.accent, textColor: .white))
                .padding()

                // MARK: Back to Authentication Choice Block
                HStack {
                    Spacer()
                    Text("Уже есть аккаунт?")
                        .foregroundColor(.white)
                    Button("Войдите") {
                        coordinator.goBackToAuthenticationChoice()
                    }
                    .foregroundColor(ColorsEnum.accent)
                    .padding()
                    Spacer()
                }
            }
            .padding()
            .navigationTitle("Registration")

            // DatePicker overlay
            if isDatePickerPresented {
                Color.black.opacity(0.3).edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        isDatePickerPresented.toggle()
                    }

                VStack {
                    DatePicker("", selection: $viewModel.birthDate, displayedComponents: [.date])
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .padding()
                        .onChange(of: viewModel.birthDate) { newValue in
                            viewModel.updateFormattedBirthDate()
                        }
                        .background(Color.white)
                        .cornerRadius(20)
                        .padding()
                        .overlay(
                            Button("Принять") {
                                hideKeyboard()
                                isDatePickerPresented.toggle()
                            }
                            .buttonStyle(CustomButtonStyle(color: ColorsEnum.accent, textColor: .white))
                            .padding()
                            .offset(y: 90)
                            , alignment: .bottom
                        )
                }
            }
        }
    }

    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    private var backButton: some View {
        Button(action: {
            coordinator.goBackToAuthenticationChoice()
        }) {
            Image(systemName: "chevron.left")
                .font(.title2)
                .foregroundColor(.white)
        }
    }
}

struct RegistrationScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationScreenView(viewModel: RegistrationViewModel(), coordinator: RegistrationCoordinator())
    }
}
