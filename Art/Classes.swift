//
//  Classes.swift
//  Voting scoring system of Art Festival
//
//  Created by 刘佳航 on 2021/2/6.
//
import SwiftUI
import Combine

class Clas : Identifiable , Codable{
    let id = UUID()
    
}

 class Classes: ObservableObject{
    var name = "未登录"
    @Published var people :[Clas]
    
    init() {
        self.people = []
    }
}
