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
        // Do any additional setup after loading the view.
    }

    let descubraOAnimalzinho: String = "golfinho_fofinho"
    let dialogMessage = UIAlertController(title: "Atenção", message: "Presta atenção seu burro", preferredStyle: .alert)
    @IBOutlet weak var campoImagem: UIImageView!
    @IBOutlet weak var button: UIButton!
     
    @IBOutlet weak var golfinho_fofinho: UITextField!
    @IBAction func carregarImagem(_ sender: Any) {
        
        if descubraOAnimalzinho == golfinho_fofinho.text {
            campoImagem.image = UIImage(named: "golfinho_fofinho")
        }
        else {
            self.present(dialogMessage, animated: true, completion: nil)
        }
    }
    
    




}



