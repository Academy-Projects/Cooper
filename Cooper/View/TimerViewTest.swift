//
//  TimerViewTest.swift
//  Cooper
//
//  Created by kevin marinho on 24/09/22.
//

import SwiftUI

struct TimerViewTest: View {
    @State var timerRemaining = 60
    @State var jump = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack{
            Text("\(timerRemaining)")
                .font(Font.custom("SourceSans3-Bold", size: 25))
                .foregroundColor(Color(red: 254/255, green: 179/255, blue: 18/255, opacity: 1))
                .onReceive(timer) {_ in
                    if timerRemaining > 0{
                        timerRemaining -= 1
                    } else {
                        jump = true
                        
                        timer.upstream.connect().cancel()
                    }
                }
            NavigationLink("pular", destination: HistoryView(), isActive: $jump)
        }
    }
}

struct TimerViewTest_Previews: PreviewProvider {
    static var previews: some View {
        TimerViewTest()
    }
}
