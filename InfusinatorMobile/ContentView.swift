//
//  ContentView.swift
//  InfusinatorMobile
//
//  Created by Evan Cedeno on 4/1/25.
//

import SwiftUI
import SwiftData

enum Page {
    case main
    case myMeds
    case settings
    case history
}

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    
    @Query var treatments: [Treatment]
    @Query(sort: \Injection.date, order: .reverse) var injections: [Injection]
    @Query var users: [User]
    
    @State var page: Page = .main
    
    var body: some View {
        if users.isEmpty {
            Text("Loading data...")
                .onAppear {
                    if users.isEmpty {
                        let treatment = Treatment(name: "Advate", dose: 3600, unit: "mg", color: 0)
                        let user = User(name: "Evan", stars: 0, primaryTreatmentID: treatment.id)
                        let injection = Injection(date: Date(), treatmentID: treatment.id, comment: "So good!")
                        
                        ModelManager.addTreatment(context, treatment)
                        ModelManager.addUser(context, user)
                        ModelManager.addInjection(context, injection)
                    }
                }
        }
        else {
            if let user = users.first {
                if page == .main {
                    MainView(page: $page, user: user)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
