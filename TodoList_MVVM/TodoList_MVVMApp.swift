//
//  TodoList_MVVMApp.swift
//  TodoList_MVVM
//
//  Created by 江啟綸 on 2022/5/25.
//

import SwiftUI


/*
 MVVM Architecture
 
 Model - dara point
 View - UI
 ViewModel - manages Models for View
 
 
 */

@main
struct TodoList_MVVMApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
            
        }
    }
}
