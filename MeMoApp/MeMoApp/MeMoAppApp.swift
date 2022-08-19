//
//  MeMoAppApp.swift
//  MeMoApp
//
//  Created by LIMGAUI on 2022/08/19.
//

import SwiftUI

@main
struct MeMoAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
