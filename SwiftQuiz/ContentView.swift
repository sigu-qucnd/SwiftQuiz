//
//  ContentView.swift
//  SwiftQuiz
//
//  Created by Ryo Nagasawa on 2020/08/01.
//  Copyright © 2020 Ryo Nagasawa. All rights reserved.
//

import SwiftUI

   struct User: Codable {
       let name: String
       let age: Int
       let message: String?  // オプショナル型にする
   }

struct ContentView: View {
    var body: some View {
       Button(action: {
            // messageが省略された場合

        
        // ルートがArrayの場合
        
        guard let jsonData = try? getJSONData() else { return }
        guard let users = try? JSONDecoder().decode([User].self, from: jsonData) else { return }
         print("users: \(users[1].name)")

        }){
            Text("Button")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func getJSONData() throws -> Data? {
    guard let path = Bundle.main.path(forResource: "quiz", ofType: "json") else { return nil }
    let url = URL(fileURLWithPath: path)

    return try Data(contentsOf: url)
}
