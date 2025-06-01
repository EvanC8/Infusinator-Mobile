//
//  InfusinatorMobileApp.swift
//  InfusinatorMobile
//
//  Created by Evan Cedeno on 4/1/25.
//

import SwiftUI
import SwiftData

@main
struct InfusinatorMobileApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [
                    Injection.self,
                    Treatment.self,
                    User.self
                ])
        }
    }
}
