//
//  ViewController.swift
//  Animalzinho
//
//  Created by Marielly on 13/01/22.
//

import UIKit

class GuessTheCityViewController: UIViewController {
    
    // MARK: - Properties
    var cities: [String] = ["cairo", "nova york", "rio de janeiro", "paris", "moscou"]
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
        cities.shuffle()
        imageField.image = UIImage(named: cities[count])
        self.navigationItem.setHidesBackButton(true, animated: true);
    }
    
    // MARK: - Functions
    func increaseCountAnUpdate() {
        if count < cities.count - 1 {
            count = count + 1
            imageField.image = UIImage(named: cities[count])
        } else {
            gameOver()
        }
    }
    
    func gameOver() {
        alert = UIAlertController(title: "FIM DE JOGO!", message: "Sua pontuação final foi de \(score) pontos", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            self.restartGame()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func restartGame(){
        self.count = 0
        self.score = 0
        self.cities.shuffle()
        self.imageField.image = UIImage(named: self.cities[self.count])
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - Actions
    @IBAction func carregarImagem(_ sender: Any) {
        if textField.text!.isEmpty {
            alert = UIAlertController(title: "Atenção", message: "Este campo não pode ficar em branco", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok",style: .default, handler: { (action: UIAlertAction!) in }))
            self.present(alert, animated: true, completion: nil)
        } else if  textField.text?.uppercased() == cities[count].uppercased() {
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



