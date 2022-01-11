//
//  ViewController.swift
//  CodewithFun
//
//  Created by Isaac Kim on 1/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var countLabel: UILabel!
    @IBOutlet var countButton: UIButton!
    @IBOutlet var sendButton: UIButton!
    
    var countNum = 0 {
        didSet {
            countLabel.text = "\(countNum)"
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonConfigure()
        
        
    }
    
    func buttonConfigure() {
        countButton.layer.cornerRadius = countButton.layer.frame.height / 2
        countButton.layer.borderColor = UIColor.cyan.cgColor
        countButton.layer.borderWidth = 1
        
        sendButton.layer.cornerRadius = countButton.layer.frame.height / 2
        sendButton.layer.borderColor = UIColor.cyan.cgColor
        sendButton.layer.borderWidth = 1
        
    }

    @IBAction func countButtonTapped(_ sender: UIButton) {
        
        countNum += 1
                
    }
    
    

    @IBAction func sendButtonTapped(_ sender: UIButton) {
        
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyBoard.instantiateViewController(withIdentifier: secondViewControllerStoryboard) as! SecondViewController
        
        secondVC.counNum = countNum
        secondVC.numDelegate = self
        
        secondVC.modalPresentationStyle = .fullScreen
        self.present(secondVC, animated: true, completion: nil)
//        present(secondVC, animated: true, completion: nil)
        
        

    }
    
}

extension ViewController: NumberResetDelegate {
    func backgroundColor(color: UIColor) {
        view.backgroundColor = color
    }
    
    func numberReset(num: Int) {
        countNum = num
    }
    
    
    
}

