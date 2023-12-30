//
//  ReviewDialogScreenView
//  MoviesCatalog
//
//  Created by: Arsentiy
//

import SwiftUI

struct ReviewDialogScreenView: View {
    @State private var rating = 0
    @State private var reviewText = ""
    @State private var isAnonymous = false

    var body: some View {
        ZStack {
            ColorsEnum.gray
            VStack(alignment: .leading) {
                // Заголовок
                Text("Оставить отзыв")
                    .font(.title)
                    .foregroundColor(ColorsEnum.accent)

                // Рейтинг
                HStack {
                    ForEach(1...10, id: \.self) { rating in
                        Button(action: {
                            self.rating = rating
                        }) {
                            Image(systemName: "star.fill")
                                .foregroundColor(rating <= self.rating ? .yellow : .gray)
                        }
                    }
                }

                // Текст отзыва
                TextField("Напишите отзыв", text: $reviewText)
                    .multilineTextAlignment(.leading)
                    .frame(minWidth: 100, minHeight: 100)
                    .background(.white)

                // Анонимный отзыв
                Toggle("Анонимный отзыв", isOn: $isAnonymous)

                // Кнопки сохранения и отмены
                VStack {
                    Button("Сохранить") {
                        // TODO: Сохранить отзыв
                    }
                        .frame(width: 308, height: 42)
                       // .padding(12)
                        .background(ColorsEnum.accent)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .bold()
                    
                    Button("Отмена") {
                        // TODO: Отменить отзыв
                    }
                        .frame(width: 308, height: 42)
                        .background(ColorsEnum.getColor(of: .gray, by: 0.1))
                       // .padding(12)
                        .cornerRadius(10)
                        .foregroundColor(ColorsEnum.accent)
                        .bold()
                }
            }
        }.frame(maxWidth: 360, maxHeight: 300)
    }
    
}

struct ReviewDialogScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewDialogScreenView()
    }
}
