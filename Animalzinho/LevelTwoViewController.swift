//
//  LevelTwoViewController.swift
//  Animalzinho
//
//  Created by Jonatan Ortiz on 17/02/22.
//

import UIKit

class LevelTwoViewController: UIViewController {
    var score: Int = 0

    // MARK: - didLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true);
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "GuessTheCityViewController") as? GuessTheCityViewController
            vc?.score = self.score
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
}
