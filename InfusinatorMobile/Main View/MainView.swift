//
//  MainView.swift
//  InfusinatorMobile
//
//  Created by Evan Cedeno on 5/31/25.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @Binding var page: Page
    
    @Bindable var user: User
    
    @Query(sort: \Injection.date, order: .reverse) var injections: [Injection]
    
    var body: some View {
        NavigationView {
            ZStack {
                
            }
            .navigationTitle("Hi, \(user.name)")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    StarNavItem(user: user)
                }
            }
        }
    }
}
