//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 12.02.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        let result = sortAnimals()
        animalLabel.text = "Вы - \(String(result.rawValue))!"
        definitionLabel.text = result.definition
        
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    func sortAnimals() -> Animal {
        let countAnimals = answersChosen.reduce(into: [:]) { counts, value in
            counts[value.animal, default: 0] += 1
        }
        
        let sortedAnimals = countAnimals.sorted(by: {$0.value > $1.value}).map( {$0.key} )
        
        return sortedAnimals.first!
    }
}
