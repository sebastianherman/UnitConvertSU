//
//  Units.swift
//  UnitConvertSU
//
//  Created by Sebastian Herman on 5/18/20.
//  Copyright © 2020 Sebastian Herman. All rights reserved.
//

import Foundation

enum Units: String {
    case kilometres = "km"
    case metres = "m"
    case miles = "mi"
    case yards = "yd"
    case feet = "ft"
    
    func getUnit() -> UnitLength {
        switch self {
        case .kilometres:
            return UnitLength.kilometers
        case .metres:
            return UnitLength.meters
        case .miles:
            return UnitLength.miles
        case .yards:
            return UnitLength.yards
        case .feet:
            return UnitLength.feet
        }
    }
}
