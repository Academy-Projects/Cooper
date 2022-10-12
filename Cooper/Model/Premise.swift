//
//  Premise.swift
//  Cooper
//
//  Created by kevin marinho on 12/10/22.
//

import SwiftUI

struct Premise{
    var buttonPressed:Int
    var opacityButton:Double
    var opacityPlay: Double
}

struct FlatLinkStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}
