//
//  CustomExtensions.swift
//  DanteToolkit
//
//  Created by DANTE GARCIA RAMIREZ on 2/27/17.
//  Copyright © 2017 Dante Studios. All rights reserved.
//

import Foundation

extension Double {
    func roundTo(sigFigs: Int) -> Double {
        let exponentialPower = pow(10.0, Double(sigFigs))
        return (self * exponentialPower).rounded() / exponentialPower
    }
}
