//
//  DrawnViewModel.swift
//  Cooper
//
//  Created by kevin marinho on 12/10/22.
//

import SwiftUI

struct DrawnViewModel {
   var propertiesDrawn = Drawn(
        // tempo do cronometro
        timerRemaining: 60,
        //pula a view
        jump: false,
        //mostra popOver
        showPopover: false,
        // Faz o Pop-Up aparecer ou não
        presentResultAlert: false,
        //lista de pictogramas
        imagens: [["homempic", "sentandopic", "círculopic", "triangulopic", "adiçãopic","seta","checkpic", "retapic", "folhapic", "bussulapic", "ônibuspic", "nuvempic", "ursopic","bolsapic", "coraçaopic", "Explosao", "gotapic"],
                  ["andandopic","bbpic", "quadradopic", "estrelapic", "igualpic", "maiorpic", "ondapic", "facapic", "musicapic", "tempopic", "raiopic", "autofalantepic", "caixãopic", "dinheiropic", "fogopic", "maçapic", "refeiçãopic"]]
   )
}


