//
//  SwiftUiCoreDataApp.swift
//  SwiftUiCoreData
//
//  Created by Neosoft on 09/11/23.
//

import SwiftUI

@main
struct SwiftUiCoreDataApp: App {
    
    let presistentContainer = DataBaseManager.shared.presistentContainer
    var body: some Scene {
        WindowGroup {
            ContentView(coreDm: DataBaseManager.shared).environment(\.managedObjectContext, presistentContainer.viewContext)
        }
    }
}
