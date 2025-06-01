//
//  Models.swift
//  InfusinatorMobile
//
//  Created by Evan Cedeno on 5/31/25.
//

import Foundation
import SwiftData

@Model
class User {
    var id: UUID
    
    var name: String
    
    var stars: Int
    var primaryPlanID: UUID
    
    init(name: String, stars: Int, primaryPlanID: UUID) {
        self.id = UUID()
        self.name = name
        self.stars = stars
        self.primaryPlanID = primaryPlanID
    }
    
}


@Model
class Treatment {
    var id: UUID
    
    var medicationName: String
    var dose: Double
    var units: String
    
    var color: Int
    
    init(medicationName: String, dose: Double, units: String, color: Int) {
        self.id = UUID()
        self.medicationName = medicationName
        self.dose = dose
        self.units = units
        self.color = color
    }
}

@Model
class Injection {
    var id: UUID
    
    var date: Date
    var treatment: Treatment
    var comment: String
    
    init(date: Date, treatment: Treatment, comment: String) {
        self.id = UUID()
        self.date = date
        self.treatment = treatment
        self.comment = comment
    }
}
