//
//  LevelOneViewController.swift
//  Animalzinho
//
//  Created by Jonatan Ortiz on 17/02/22.
//

import UIKit 

class LevelOneViewController: UIViewController {
    
    // MARK: - didLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "GuessTheAnimalViewController") as? GuessTheAnimalViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
}

