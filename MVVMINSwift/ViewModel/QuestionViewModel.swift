//
//  QuestionViewModel.swift
//  MVVMINSwift
//
//  Created by buse koca on 1.06.2023.
//

import Foundation

class QuestionViewModel {
    
    private var sourceURL = URL(string:"https://quiz-68112-default-rtdb.firebaseio.com/quiz.json")!
    var questionModel: DataModel?
    func getAllTheQuestion(completion: @escaping () ->()) {
        URLSession.shared.dataTask(with: sourceURL) { [weak self] (data, response, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let finalMo = try! jsonDecoder.decode(DataModel.self, from: data)
                self?.questionModel = finalMo
                print(finalMo)
                completion()
            }
        }.resume()
    }
}
