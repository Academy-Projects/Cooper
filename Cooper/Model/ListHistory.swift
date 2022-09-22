//
//  ListHistory.swift
//  Cooper
//
//  Created by kevin marinho on 30/08/22.
//

import SwiftUI
import Foundation
// declara a variável que irá armazenar a resposta escolhida do master
public var answerChoice:Int = 0

struct ListHistory: Identifiable{
    var id = UUID()
    var title: String
    var premise: String
    var instruction: String
    var warning: String
    var image: String
    var finalOne: String
    var finalTwo: String
    var finalThree: String
}

var naps = [
    ListHistory(
        title: "A terra da Rainha",

        premise: "Durante sua viagem pela cidade de Londres, cidade inglesa, você é parado pela polícia portando uma espada, Qual a sua explicação ?",
        instruction: "Escolha a resposta que você dará aos policiais e que irá comunicar por meio de pictogramas. ",
        warning: "Lembre-se: se os policiais não entenderem o que você está falando, você será preso! Será que você consegue se livrar dessa ?",
        image: "london",
        finalOne: "A) Você recentemente descobriu que é o descendente do rei Arthur",
        finalTwo: "B) Você está caçando uma girafa que fugiu do zoológico de Londres",
        finalThree: "C) Você estava em Londres para um campeonato de esgrima"
    ),
    ListHistory(
        title: "Meu amigo pool" ,
        premise: "Durante seu passeio nas montanhas de Toronto, cidade canadense, a polícia avista você cheio de sangue correndo pela floresta. Qual a sua explicação ?",

        instruction: "Escolha a resposta que você dará aos policiais e que irá comunicar por meio de pictogramas.",
        warning: "Lembre-se: se os policiais não entenderem o que você está falando, você será preso! Será que você consegue se livrar dessa ?",
        image: "canada",
        finalOne: "A) Você se machuca na floresta e acaba atraindo um urso e sai correndo.",
        finalTwo: "B) Você avista um urso pequeno machucado cheio de sangue e corre pedindo ajuda.",
        finalThree: "C) Você é atacado desprevinido por um urso e sai correndo pedindo ajuda."
    ),
    ListHistory(
        title: "Uma notícia bombástica",
        premise: "Durante a sua viagem de trem para Cusco, cidade peruana, houve uma revista e sua mala foi detida pela polícia. Qual a sua explicação ? ",
        instruction: "Escolha a resposta que você dará aos policiais e que irá comunicar por meio de pictogramas.",
        warning: "Lembre-se: se os policiais não entenderem o que você está falando, você será preso! Será que você consegue se livrar dessa ?",
        image: "lhama",
        finalOne: "A) Foram encontrados explosivos na sua mala, mas você percebe que ela foi trocada por engano.",
        finalTwo: "B) Você estava indo fazer teste com explosivos como agente da CIA, mas tinha permissão.",
        finalThree: "C) Eram explosivos de brinquedo que ia dar para o seu sobrinho que sonha em ser um Detonador"

    )
]
