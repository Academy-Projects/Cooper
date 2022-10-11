//
//  History.swift
//  Cooper
//
//  Created by kevin marinho on 10/10/22.
//

import SwiftUI

struct History{
    var idx: Int
    // titulo dos paises da historia
    var titulo: [String]
    // cards das historias
    var card: [String]
    var presentResultAlert: Bool
    var result: Bool
    //imagem do personagem
    var personagem: String
    
}

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
        else if index == 3 {
            PremiseView(story: naps[3])
        }
        else if index == 4 {
            PremiseView(story: naps[4])
        }
        else if index == 5 {
            PremiseView(story: naps[5])
        }
        else {
            UnavailableAlert(show: $presentResultAlert)
     }
  }
}

//struct que contem image bloqueada
struct ItemViewBlocked: View {

var image: String
var font = FontViewModel()

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
                .font(Font.custom(font.font.FontBoogaloo, size: 30))
                .foregroundColor(Color("colorFont"))
        }
    }
  }
}

//struct que contem a a image da lista

struct ItemView: View {

var image: String
var country: String
var font = FontViewModel()

var body: some View {
    ZStack{
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .shadow(color: Color(red: 0/255, green: 59/255, blue: 75/255), radius: 0, x: 5, y: 5)
            .padding(.bottom, 10)
        ZStack{
            Text(country)
                .font(Font.custom(font.font.FontBoogaloo, size: 30))
                .foregroundColor(Color("colorFont"))
                .frame(width: UIScreen.main.bounds.width * 0.10, height: UIScreen.main.bounds.height * 0.020)
                
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.trailing, 142)
            .padding(.bottom, 134)
    }
  }
}


