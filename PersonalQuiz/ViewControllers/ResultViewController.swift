//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var definitionResultLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        let animalCounts = answersChosen.reduce(into: [:]) { counts, answerChosen in
            counts[answerChosen.animal, default: 0] += 1
        }
        
        if let resultAnimalName = animalCounts.max(by: { $0.value < $1.value })?.key {
            resultLabel.text = "Вы — \(resultAnimalName.rawValue)"
            definitionResultLabel.text = resultAnimalName.definition
        } else {
            resultLabel.text = ""
            definitionResultLabel.text = ""
        }
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
