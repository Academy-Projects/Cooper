//
//  HistoryView.swift
//  Cooper
//
//  Created by kevin marinho on 26/08/22.
//

import SwiftUI

// condicional para verificar se há historias disponiveis
struct Condition: View{
    var index: Int
    var body: some View{
        if index == 0 {
            PremiseView(story: naps[0])
        }
//        else if index == 1{
//            PremiseView(story: naps[1])
//        }
//        else if index == 2 {
//            PremiseView(story: naps[2])
//        }
        else{
            ZStack{
                Text("aqui vai ter um alert talvez quem sabe?")
            }
     }
    }
  }

//struct que contem a a image da lista

struct ItemView: View {

var image: String

var body: some View {
    Image(image)
        .resizable()
        .aspectRatio(contentMode: .fit)
  }
}



struct HistoryView: View {
    @State var idx: Int = 0
//fotos das historias
    @State var data: [String] = ["blocked","blocked","blocked", "blocked", "blocked", "blocked", "blocked", "blocked"]
 // grid para setar array das historias
    let layout = [
        GridItem(.flexible(), spacing: 30),
        GridItem(.flexible(), spacing: 30)
    ]
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("Escolha para qual momento da história \nvocê deseja viajar com o Cooper")
                        .font(Font.custom("SourceSans3-Bold", size: 25))
                        .multilineTextAlignment(.center)
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.092)
                    .padding(.leading, 556)
                    .padding(.trailing, 74)
                    .padding(.bottom, 50)
             ScrollView(.horizontal, showsIndicators: false){
                 HStack(){
                        Image("woman")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                     //lazy grid que tras o array de imagens e foreach que contem os dados delas
                        LazyHGrid(rows: layout, spacing: 23){
                            ForEach(data.indices) { idx in
                                VStack(){
                                    NavigationLink(destination:
                                       Condition(index: idx)
                                    ){
                                      ItemView(image: data[idx])
                                }
                             }
                            }
                         }
                    }.frame(height: UIScreen.main.bounds.height * 0.52)
             }
           }
        }.frame(maxHeight: .infinity)
         .background(.cyan)
         .navigationBarHidden(true)

    }
}


