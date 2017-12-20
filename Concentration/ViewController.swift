//
//  ViewController.swift
//  Concentration
//
//  Created by Michael Owen on 19/12/2017.
//  Copyright © 2017 Michael Owen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var game = Concentration(numberOfPairsOfCard: (cardbuttons.count + 1) / 2)
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardbuttons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardbuttons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Chosen card not in cardbuttons")
        }
    }
    
    func updateViewFromModel() {
        for index in cardbuttons.indices {
            let button = cardbuttons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5695850849, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5695850849, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["😈","👻","🎃","☠️","💀","👺"]
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil , emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        
        return emoji[card.identifier] ?? "?" 

    }
}

