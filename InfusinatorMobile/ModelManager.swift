//
//  ModelManager.swift
//  InfusinatorMobile
//
//  Created by Evan Cedeno on 5/31/25.
//

import Foundation
import SwiftData

class ModelManager {
    //MARK: Insert (by object)
    static func addInjection(_ context: ModelContext, _ injection: Injection) {
        context.insert(injection)
        saveContext(context)
    }
    
    static func addUser(_ context: ModelContext, _ user: User) {
        context.insert(user)
        saveContext(context)
    }
    
    static func addTreatment(_ context: ModelContext, _ treatment: Treatment) {
        context.insert(treatment)
        saveContext(context)
    }
    
    //MARK: Insert (by parameter)
    static func addInjection(_ context: ModelContext, date: Date, treatmentID: UUID, comment: String) {
        let injection = Injection(date: date, treatmentID: treatmentID, comment: comment)
        context.insert(injection)
        saveContext(context)
    }
    
    static func addUser(_ context: ModelContext, name: String, stars: Int, primaryTreatmentID: UUID) {
        let user = User(name: name, stars: stars, primaryTreatmentID: primaryTreatmentID)
        context.insert(user)
        saveContext(context)
    }
    
    static func addTreatment(_ context: ModelContext, name: String, dose: Double, unit: String, color: Int) {
        let treatment = Treatment(name: name, dose: dose, unit: unit, color: color)
        context.insert(treatment)
        saveContext(context)
    }
    
    //MARK: Delete
    static func deleteInjection(_ context: ModelContext, injection: Injection) {
        context.delete(injection)
        saveContext(context)
    }
    
    static func deleteUser(_ context: ModelContext, user: User) {
        context.delete(user)
        saveContext(context)
    }
    
    static func deleteTreatment(_ context: ModelContext, treatment: Treatment) {
        context.delete(treatment)
        saveContext(context)
    }
    
    //MARK: Modify
    static func updateInjection(_ context: ModelContext, injection: Injection, date: Date? = nil, treatmentID: UUID? = nil, comment: String? = nil) {
        injection.date = date ?? injection.date
        injection.treatmentID = treatmentID ?? injection.treatmentID
        injection.comment = comment ?? injection.comment
        saveContext(context)
    }
    
    static func updateUser(_ context: ModelContext, user: User, name: String? = nil, stars: Int? = nil, primaryTreatmentID: UUID? = nil) {
        user.name = name ?? user.name
        user.stars = stars ?? user.stars
        user.primaryTreatmentID = primaryTreatmentID ?? user.primaryTreatmentID
        saveContext(context)
    }
    
    static func updateTreatment(_ context: ModelContext, treatment: Treatment, color: Int) {
        treatment.color = color
        saveContext(context)
    }
    
    //MARK: Saving & Error Handling
    static func saveContext(_ context: ModelContext) {
        do {
            try context.save()
            print("Saved context successfully")
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}
