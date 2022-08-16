//
//  DrawnView.swift
//  Cooper
//
//  Created by kevin marinho on 15/08/22.
//

import Foundation
import SwiftUI

struct DrawnView: View {
    var body: some View{
        ZStack{
            Color(red: 45/255, green: 29/255, blue: 66/255).ignoresSafeArea(.all)
            Text("oi")
                .padding()
                .background()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DrawnView()
    }
}
