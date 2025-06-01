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
    var primaryTreatmentID: UUID
    
    init(name: String, stars: Int, primaryTreatmentID: UUID) {
        self.id = UUID()
        self.name = name
        self.stars = stars
        self.primaryTreatmentID = primaryTreatmentID
    }
    
}


@Model
class Treatment {
    var id: UUID
    
    var name: String
    var dose: Double
    var unit: String
    
    var color: Int
    
    init(name: String, dose: Double, unit: String, color: Int) {
        self.id = UUID()
        self.name = name
        self.dose = dose
        self.unit = unit
        self.color = color
    }
}

@Model
class Injection {
    var id: UUID
    
    var date: Date
    var treatmentID: UUID
    var comment: String
    
    init(date: Date, treatmentID: UUID, comment: String) {
        self.id = UUID()
        self.date = date
        self.treatmentID = treatmentID
        self.comment = comment
    }
}
