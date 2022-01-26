//
//  ViewController.swift
//  Animalzinho
//
//  Created by marielly on 13/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    var animals: [String] = ["golfinho", "leão", "gato", "capivara", "ornitorrinco"]
    var count: Int = 0
    var points: Int = 0
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
        alert = UIAlertController(title: "FIM DE JOGO!", message: "Sua pontuação final foi de \(points) pontos", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            self.restartGame()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func restartGame(){
        self.count = 0
        self.points = 0
        self.animals.shuffle()
        self.imageField.image = UIImage(named: self.animals[self.count])
    }
    
    // MARK: - Actions
    @IBAction func carregarImagem(_ sender: Any) {
        
        if  textField.text?.uppercased() == animals[count].uppercased() {
            points = points + 10
            alert = UIAlertController(title: "Atenção", message: "10 pontos para a Grifinória! Sua pontuação atual é \(points)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok",style: .default, handler: { (action: UIAlertAction!) in
                self.increaseCountAnUpdate()
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        else {
            if points > 0 {
                points = points - 5
            }
            alert = UIAlertController(title: "Atenção", message: "Presta atenção seu burro!Sua pontuação atual é \(points)",  preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok",style: .default, handler: { (action: UIAlertAction!) in
                self.increaseCountAnUpdate()
            }))
            self.present(alert, animated: true, completion: nil)
        }
        textField.text = ""
        
    }
    
    
    
    
    
    
}



