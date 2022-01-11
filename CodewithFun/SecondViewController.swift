//
//  SecondViewController.swift
//  CodewithFun
//
//  Created by Isaac Kim on 1/10/22.
//

import UIKit

protocol NumberResetDelegate {
    func numberReset(num: Int)
    func backgroundColor(color: UIColor)
}

enum Color: String {
    case red
    case blue
    case green
}

class SecondViewController: UIViewController {
    
    @IBOutlet var countLabel: UILabel!
    var numDelegate: NumberResetDelegate?
    var colorArray = ["red","orange","yellow"]
    
    
    
    var counNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(counNum)
        countLabel.text = "\(counNum)"
        
    }
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        counNum = 0
        countLabel.text = "\(counNum)"
        
    }
    
    @IBAction func changeColorButtonTapped(_ sender: UIButton) {
        
        guard let randomColor = colorArray.randomElement() else { return }
        
        numDelegate?.backgroundColor(color: randomUIColorGenerator(color: randomColor))
        numDelegate?.numberReset(num: counNum)
        dismiss(animated: true)
        
    }
    
    func randomUIColorGenerator(color: String) -> UIColor {
        
        switch color {
        case "red":
            return UIColor.red
        case "orange":
            return UIColor.orange
        case "yellow":
            return UIColor.yellow
            
        default:
            return UIColor.white
        }
    }
    
}



