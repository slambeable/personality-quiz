//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответствии с этим животным
    // 4. Избавиться от кнопки возврата на предыдущий экран
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answersChosen: [Answer]!

    private var answerCounters: [Animal: Int] = [
        .dog: 0,
        .cat: 0,
        .rabbit: 0,
        .turtle: 0,
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.setHidesBackButton(true, animated: false)
        
        let frequentAnswer = choseFrequentAnswer()

        updateUI(for: frequentAnswer)
    }
    
    private func choseFrequentAnswer() -> Animal {
        answersChosen.forEach {
            answerCounters.updateValue(answerCounters[$0.animal]! + 1, forKey: $0.animal)
        }
        
        return answerCounters.max { $0.value < $1.value }?.key ?? .dog
    }
}

extension ResultViewController {
    private func updateUI(for frequentAnswer: Animal) {
        titleLabel.text = "Вы - \(frequentAnswer.rawValue)!"
        descriptionLabel.text = frequentAnswer.definition
    }
}
