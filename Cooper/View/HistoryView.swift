//
//  HistoryView.swift
//  Cooper
//
//  Created by kevin marinho on 26/08/22.
//

import SwiftUI
// tirar essa merda daqui 
public var indexQuestion: Int = 0

struct HistoryView: View {
    private var historyModelView = HistoryModelView()
    private var font = FontViewModel()
    
    @Environment(\.colorScheme) var colorScheme
    
    // grid para setar array das historias
    let layout = [
        GridItem(.flexible(), spacing: 30),
        GridItem(.flexible(), spacing: 30)
    ]
    
    var body: some View {
    ZStack{
        HStack{
            NavigationLink(destination: OnBoardingView(),
                    label: {
                        Rectangle()
                        Text("?")
                            .font(Font.custom(font.font.FontBoogaloo, size: 35))
                            .foregroundColor(Color("colorFont"))
                            .frame(width: UIScreen.main.bounds.width * 0.03, height: UIScreen.main.bounds.height * 0.04)
                            .background(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .background(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(red: 0/255, green: 59/255, blue: 75/255), lineWidth: 3)
                            )
                            .shadow(color: Color(red: 0/255, green: 59/255, blue: 75/255), radius: 0, x: 0, y: 0)
                    }).frame(width: UIScreen.main.bounds.width * 0.026, height: UIScreen.main.bounds.height * 0.040)
                      .padding(EdgeInsets(top: 65, leading: 0, bottom: 0, trailing: 65))
                      .buttonStyle(FlatLinkStyle())

        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .frame(maxHeight: .infinity, alignment: .top)
            VStack{
                HStack{
                    Text("Escolha o próximo destino da sua viagem")
                        .font(Font.custom(font.font.FontSourceSansBold, size: 30))
                        .minimumScaleFactor(0.1) //<--Here
                        .frame(width: UIScreen.main.bounds.width * 0.50, height: UIScreen.main.bounds.height * 0.04)
                        .multilineTextAlignment(.center)
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.092)
                    .padding(.leading, 556)
                    .padding(.trailing, 74)
                    .padding(.bottom, 50)
             ScrollView(.horizontal, showsIndicators: false){
                 HStack(spacing: 40){
                     Image(historyModelView.history.personagem)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.leading, 80)
                     //lazy grid que tras o array de imagens e foreach que contem os dados delas
                        LazyHGrid(rows: layout, spacing: 23){
                            ForEach(historyModelView.history.card.indices) { idx in
                                VStack(){
                                    if(idx < 6){
                                        NavigationLink(destination:
                                           Condition(index: idx)
                                        ){
                                            ItemView(image: historyModelView.history.card[idx], country: historyModelView.history.titulo[idx])
                                          
                                        }.simultaneousGesture(TapGesture().onEnded {
                                            indexQuestion = idx
                                        })
                                    }else{
                                        Button(
                                            action: {
                                         //   presentResultAlert.toggle()
                                        }, label: {ItemViewBlocked(image: historyModelView.history.card[idx])})
                                    }
                                }
                            }
                         }
                 }.frame(height: UIScreen.main.bounds.height * 0.52)
             }
           }
        }.frame(maxHeight: .infinity)
    
            .background( LinearGradient(gradient: Gradient(colors: [Color("backgroundIlustration"), Color("backgroundIlustration"), Color("backgroundIlustration"), Color("backgroundIlustrationWhite")]),
                                    startPoint: .leading,
                                    endPoint: .trailing))
         .navigationBarHidden(true)

    }
}


