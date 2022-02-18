//
//  ViewController.swift
//  Animalzinho
//
//  Created by marielly on 13/01/22.
//

import UIKit

class GuessTheAnimalViewController: UIViewController {
    
    // MARK: - Properties
    var animals: [String] = ["golfinho", "leão", "gato", "capivara", "ornitorrinco"]
    var count: Int = 0
    var score: Int = 0
    var points: Int = 10
    var alert = UIAlertController()
    
    // MARK: - Screen properties
    @IBOutlet weak var imageField: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    // MARK: - didLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        animals.shuffle()
        imageField.image = UIImage(named: animals[count])
        self.navigationItem.setHidesBackButton(true, animated: true);
    }
    
    // MARK: - Functions
    func increaseCountAnUpdate() {
        if count < animals.count - 1 {
            count = count + 1
            imageField.image = UIImage(named: animals[count])
        } else {
            gameOver()
        }
    }
    
    func gameOver() {
        if self.score == 50 {
            goToNextLevel()
        } else {
            restartGame()
        }
    }
    
    func restartGame() {
        alert = UIAlertController(title: "FIM DO JOGO!", message: "Sua pontuação final foi de \(score) pontos. Você não atingiu a pontuação máxima, tente novamente.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            self.count = 0
            self.score = 0
            self.animals.shuffle()
            self.imageField.image = UIImage(named: self.animals[self.count])
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func goToNextLevel() {
        alert = UIAlertController(title: "FIM DO PRIMEIRO NÍVEL!", message: "Sua pontuação final foi de \(score) pontos. Segundo desbloqueado.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LevelTwoViewController") as? LevelTwoViewController
            vc?.score = self.score
            self.navigationController?.pushViewController(vc!, animated: true)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Actions
    @IBAction func carregarImagem(_ sender: Any) {
        if textField.text!.isEmpty {
            alert = UIAlertController(title: "Atenção", message: "Este campo não pode ficar em branco", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok",style: .default, handler: { (action: UIAlertAction!) in }))
            self.present(alert, animated: true, completion: nil)
        } else if  textField.text?.uppercased() == animals[count].uppercased() {
            score = score + points
            alert = UIAlertController(title: "Parabéns!", message: "Resposta correta. \(points) pontos! Sua pontuação atual é \(score)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok",style: .default, handler: { (action: UIAlertAction!) in
                self.increaseCountAnUpdate()
            }))
            
            self.present(alert, animated: true, completion: nil)
        } else {
            if score > 0 {
                score = score - 5
            }
            alert = UIAlertController(title: "Atenção", message: "Resposta incorreta! Sua pontuação atual é \(score)",  preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok",style: .default, handler: { (action: UIAlertAction!) in
                self.increaseCountAnUpdate()
            }))
            self.present(alert, animated: true, completion: nil)
        }
        textField.text = ""
    }
}



