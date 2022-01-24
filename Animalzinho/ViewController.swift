//
//  ViewController.swift
//  Animalzinho
//
//  Created by marielly on 13/01/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        campoImagem.image = UIImage(named: "golfinho_fofinho")
        errorMessage.addAction(UIAlertAction(title: "Ok",style: .default, handler: { (action: UIAlertAction!) in }))
        rightAnswerMessage.addAction(UIAlertAction(title: "Ok",style: .default, handler: { (action: UIAlertAction!) in }))
    }

    let descubraOAnimalzinho: String = "golfinho_fofinho"
    let errorMessage = UIAlertController(title: "Atenção", message: "Presta atenção seu burro", preferredStyle: .alert)
    let rightAnswerMessage = UIAlertController(title: "Atenção", message: "10 pontos para a Grifinória", preferredStyle: .alert)
    
    @IBOutlet weak var campoImagem: UIImageView!
    @IBOutlet weak var button: UIButton!
     
    @IBOutlet weak var golfinho_fofinho: UITextField!
    @IBAction func carregarImagem(_ sender: Any) {
       
        if descubraOAnimalzinho == golfinho_fofinho.text {
            self.present(rightAnswerMessage, animated: true, completion: nil)
        }
        else {
            self.present(errorMessage, animated: true, completion: nil)
        }
    }
    
    




}



