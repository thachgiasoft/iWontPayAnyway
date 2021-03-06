//
//  Project.swift
//  iWontPayAnyway
//
//  Created by Max Tharr on 23.01.20.
//  Copyright © 2020 Mayflower GmbH. All rights reserved.
//

import Foundation

struct Project: Codable, Identifiable {
    let name: String
    let password: String
    let url: String
    let id: UUID
    
    init(name: String, password: String, url: String) {
        self.name = name
        self.password = password
        self.url = url
        
        self.id = UUID()
    }
    var members: [Person] = []
    
    var bills: [Bill] = [] {
        didSet {
            print("Set bills for \(name): \(bills)")
        }
    }
}

extension Project: Equatable {
    static func == (lhs: Project, rhs: Project) -> Bool {
        return (lhs.id == rhs.id) || (lhs.url == rhs.url && lhs.name == rhs.name)
    }
}

let previewProject = Project(name: "TestProject", password: "TestPassword", url: "https://testserver.de")
let previewProjects = [
    previewProject,
    Project(name: "test1", password: "test23", url: "https://testserver.de"),
    Project(name: "test2", password: "test45", url: "https://testserver.de"),
]
