//
//  ViewController.swift
//  calculator
//
//  Created by OSU App Center on 8/3/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var contentLabel: UILabel!
    
    private var oprator:op?
    private var lastText:String?
    private var needClean:Bool = false
    
    
    enum op: Int{
        case plus = 0
        case minus = 1
        case divide = 2
        case multiple = 3
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.contentLabel.text! = ""
    }

    
    //function button
    @IBAction func ACTapped(_ sender: Any) {
        self.contentLabel.text! = ""
    }
    
    @IBAction func negationTapped(_ sender: Any) {
    }
    
    @IBAction func percentageTapped(_ sender: Any) {
    }
    
    //operators
    @IBAction func divideTapped(_ sender: Any) {
        if self.contentLabel.text! != "" {
            oprator = .divide
            self.lastText = self.contentLabel.text
            self.needClean = true
        }
    }
    
    @IBAction func multipleTapped(_ sender: Any) {
        if self.contentLabel.text! != "" {
            oprator = .multiple
            self.lastText = self.contentLabel.text
            self.needClean = true
        }
    }
    
    @IBAction func minusTapped(_ sender: Any) {
        if self.contentLabel.text! != "" {
            oprator = .minus
            self.lastText = self.contentLabel.text
            self.needClean = true
        }
    }
    
    @IBAction func plusTapped(_ sender: Any) {
        if self.contentLabel.text! != "" {
            oprator = .plus
            self.lastText = self.contentLabel.text
            self.needClean = true
        }
    }
    
    @IBAction func equalTapped(_ sender: Any) {
        if oprator != nil, self.lastText != nil {
            switch oprator! {
            case .plus:
                self.contentLabel.text! = String(Double(self.lastText!)!+Double(self.contentLabel.text!)!)
            case .minus:
                self.contentLabel.text! = String(Double(self.lastText!)!-Double(self.contentLabel.text!)!)
            case .divide:
                self.contentLabel.text! = String(Double(self.lastText!)!/Double(self.contentLabel.text!)!)
            case .multiple:
                self.contentLabel.text! = String(Double(self.lastText!)!*Double(self.contentLabel.text!)!)
            }
            
        }
        oprator = nil
        self.lastText = nil
    }
    
    @IBAction func dotTapped(_ sender: UIButton) {
        if self.contentLabel.text! != ""{
            if !self.contentLabel.text!.contains("."){
                self.contentLabel.text! += sender.titleLabel!.text!
            }
        }
    }
    
    //numbers
    
    @IBAction func numTapped(_ sender: UIButton) {
        
        if needClean {
            self.contentLabel.text! = ""
            needClean = false
        }
        self.contentLabel.text! += sender.titleLabel!.text!
    }
    
    
}

