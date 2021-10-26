//
//  SecondViewController.swift
//  ClosuresExample
//
//  Created by Jesus Jaime Cano Terrazas on 28/08/21.
//

import UIKit

protocol SecondDelegate: AnyObject {
    func secondDidSend(text: String)
}

class SecondViewController: UIViewController {
    
    var myClosure: ((String) -> Void)?
    weak var delegate: SecondDelegate?
    private var  myCoolClosure: ((String, UIColor) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func set(myCoolClosure: @escaping ((String, UIColor) ->  Void)) {
        self.myCoolClosure = myCoolClosure
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - User Interaction
    
    @IBAction func closureButtonPressed(_ sender: UIButton) {
//        myClosure?("Text sent by closure")
        
        myCoolClosure?("The text", UIColor.red)
    }
    
    @IBAction func delegateButtonPressed(_ sender: UIButton) {
        delegate?.secondDidSend(text: "Text sent by delegate")
    }
}
