//
//  ListHistory.swift
//  Cooper
//
//  Created by kevin marinho on 30/08/22.
//

import SwiftUI
import Foundation

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
        premise: "Você está em Londres e é parado pela polícia portando uma espada, qual sua explicação para a polícia ?",
        instruction: "Escolha a resposta que você dará aos policiais e que irá comunicar por meio de pictogramas. ",
        warning: "Lembre-se: se os policiais s não entenderem o que você está falando, você será preso! Será que você consegue se livrar dessa ?",
        image: "blocked",
        finalOne: "Você é o descendente do rei Arthur",
        finalTwo: "Você está caçando um girafa que fugiu do zoológico de Londres",
        finalThree: "Você é um esgrimista"
    ),
    ListHistory(
        title: "Meu amigo pool" ,
        premise: "a policia a vista voce durante seu passeio nas praias de Toronto(CANADA) cheio de sangue correndo na beira do mar desesperado, o que aconteceu ?",
        instruction: "Escolha a resposta que você dará aos policiais e que irá comunicar por meio de pictogramas.",
        warning: "Lembre-se: se os policiais s não entenderem o que você está falando, você será preso! Será que você consegue se livrar dessa ?",
        image: "blocked",
        finalOne: "Voce se machuca na floresta, e acaba atraindo um urso e sai correndo",
        finalTwo: "Voce esta na floresta passeando, quando avista um urso pequeno machucado cheio de sangue e corre pedindo ajuda",
        finalThree: "Voce é atacado desprevinido por um urso, e sai correndo pedindo ajuda"
    ),
    ListHistory(
        title: "Uma notícia bombástica",
        premise: "Durante a sua viagem de trem para Cusco, cidade peruana, houve uma revista e sua mala foi detida pela polícia. Qual a sua explicação ? ",
        instruction: "Escolha a resposta que você dará aos policiais e que irá comunicar por meio de pictogramas.",
        warning: "Lembre-se: se os policiais s não entenderem o que você está falando, você será preso! Será que você consegue se livrar dessa ?",
        image: "blocked",
        finalOne: "Foram encontrados explosivos na sua mala, mas você percebe que ela foi trocada por engano.",
        finalTwo: "Você estava indo fazer teste com explosivos como agente da CIA, mas tinha permissão.",
        finalThree: "Eram explosivos de brinquedo que você estava levando para o seu sobrinho que sonha em ser um Detonador"
    )
]
