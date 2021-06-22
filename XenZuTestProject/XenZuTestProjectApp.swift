//
//  XenZuTestProjectApp.swift
//  XenZuTestProject
//
//  Created by Viktor Kushnerov on 22.06.21.
//

import SwiftUI

@main
struct XenZuTestProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
//            ContentTestView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
