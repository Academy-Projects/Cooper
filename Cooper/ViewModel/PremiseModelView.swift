//
//  PremiseModelView.swift
//  Cooper
//
//  Created by kevin marinho on 12/10/22.
//

import SwiftUI

class PremiseModelView: ObservableObject{
 @Published var premiseInfo = Premise(
        buttonPressed: 0,
        opacityButton: 1,
        opacityPlay: 0)
}

