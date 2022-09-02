//
//  HistoryView.swift
//  Cooper
//
//  Created by kevin marinho on 26/08/22.
//

import SwiftUI

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

struct ItemView: View {

var image: String

var body: some View {
    Image(image)
        .resizable()
        .aspectRatio(contentMode: .fit)
     //   .frame(width: UIScreen.main.bounds.width * 0.17, height: UIScreen.main.bounds.height * 0.32)
  }
}



struct HistoryView: View {
    @State var idx: Int = 0
    @State var data: [String] = ["blocked","blocked","blocked", "blocked", "blocked", "blocked", "blocked", "blocked"]
    
    let layout = [
        GridItem(.flexible(), spacing: 30),
        GridItem(.flexible(), spacing: 30)
    ]
    
    var body: some View {
        ZStack{
         ScrollView(.horizontal, showsIndicators: false){
             HStack(){
                    Image("woman")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
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
        }.frame(maxHeight: .infinity)
         .background(.cyan)
         .navigationBarHidden(true)

    }
}


