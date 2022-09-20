//
//  HistoryView.swift
//  Cooper
//
//  Created by kevin marinho on 26/08/22.
//

import SwiftUI

public var indexQuestion: Int = 0

// condicional para verificar se há historias disponiveis
struct Condition: View{
    var index: Int
    @State var presentResultAlert = false
    var body: some View{
        if index == 0 {
            PremiseView(story: naps[0])
        }
        else if index == 1{
            PremiseView(story: naps[1])
        }
        else if index == 2 {
            PremiseView(story: naps[2])
        }
        else {
            UnavailableAlert(show: $presentResultAlert)
     }
    }
  }
//struct que contem image bloqueada
struct ItemViewBlocked: View {

var image: String

var body: some View {
    ZStack{
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .shadow(color: Color(red: 0/255, green: 59/255, blue: 75/255), radius: 0, x: 5, y: 5)
            .padding(.bottom, 10)
        VStack{
            Image(systemName: "lock.circle")
                .resizable()
                .foregroundColor(Color("colorFont"))
                .frame(width: UIScreen.main.bounds.width * 0.041, height: UIScreen.main.bounds.height * 0.055)
            Text("Em breve...")
                .font(Font.custom("Boogaloo-Regular", size: 30))
                .foregroundColor(Color("colorFont"))
        }
    }
  }
}


//struct que contem a a image da lista

struct ItemView: View {

var image: String
var country: String

var body: some View {
    ZStack{
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .shadow(color: Color(red: 0/255, green: 59/255, blue: 75/255), radius: 0, x: 5, y: 5)
            .padding(.bottom, 10)
        ZStack{
            Text(country)
                .font(Font.custom("Boogaloo-Regular", size: 30))
                .foregroundColor(Color("colorFont"))
                .frame(width: UIScreen.main.bounds.width * 0.10, height: UIScreen.main.bounds.height * 0.020)
                
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.trailing, 142)
            .padding(.bottom, 134)
    }
  }
}



struct HistoryView: View {
    @State var idx: Int = 0
// paises da historia
    @State var titulo: [String] = ["LONDRES", "CANADÁ", "PERU"]
//fotos das historias
    @State var data: [String] = ["cardlondres","cardcanada","cardperu", "blocked", "blocked", "blocked", "blocked", "blocked"]
 // grid para setar array das historias
    @State var presentResultAlert = false // Faz o Pop-Up aparecer ou não
    @State var result = false // Indica se o usuario acertou ou não.
    @Environment(\.colorScheme) var colorScheme
    
    let layout = [
        GridItem(.flexible(), spacing: 30),
        GridItem(.flexible(), spacing: 30)
    ]
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Escolha o próximo destino da sua viagem")
                        .font(Font.custom("SourceSans3-Bold", size: 30))
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
                        Image("PERSONAGEM")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.leading, 30)
                     //lazy grid que tras o array de imagens e foreach que contem os dados delas
                        LazyHGrid(rows: layout, spacing: 23){
                            ForEach(data.indices) { idx in
                                VStack(){
                                    if(idx < 3){
                                        NavigationLink(destination:
                                           Condition(index: idx)
                                        ){
                                            ItemView(image: data[idx], country: titulo[idx])
                                          
                                        }.simultaneousGesture(TapGesture().onEnded {
                                            indexQuestion = idx
                                        })
                                    }else{
                                        Button(
                                            action: {
                                         //   presentResultAlert.toggle()
                                        }, label: {ItemViewBlocked(image: data[idx])})
                                    }
                                }
                            }
                         }
                    }.frame(height: UIScreen.main.bounds.height * 0.52)
             }
           }
            
            if self.presentResultAlert {
//                CustomAlertView(show: $presentResultAlert, result: result).background(Color.black.opacity(0.3))
                UnavailableAlert(show: $presentResultAlert)
            }

        }.frame(maxHeight: .infinity)
    
//            .background(colorScheme == .dark ? Color.cyan : Color.yellow)
            .background( LinearGradient(gradient: Gradient(colors: [Color("backgroundIlustration"), Color("backgroundIlustration"), Color("backgroundIlustration"), Color("backgroundIlustrationWhite")]),
                                    startPoint: .leading,
                                    endPoint: .trailing))
//            .background( LinearGradient(gradient: Gradient(colors: [Color("backgroundIlustrationWhite"), Color("backgroundIlustration"), Color("backgroundIlustration"), Color("backgroundIlustrationWhite")]),
//                                    startPoint: .leading,
//                                    endPoint: .trailing))
         .navigationBarHidden(true)

    }
}


