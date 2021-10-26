//
//  ViewController.swift
//  ClosuresExample
//
//  Created by Jesus Jaime Cano Terrazas on 28/08/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //Implicit definition for a closure () -> void
        let simpleClosure = {
            print("Hello Closure Example...")
        }
        
        simpleClosure()
        
        // Explicit definition for a closure
        
        let simpleClosureWithDefinition: () -> Void = {
            print("Hello Closure with definition")
        }
        
        simpleClosureWithDefinition()
        
        // Closure with params
        
        let closureWithParams = { (numA: Int, numB: Int) in
            return numA + numB
        }
        
        print("Add: \(closureWithParams(1, 2))")
        
        let closureWithParamasExplicit: (Int, Int) -> Int = { (numA, numB) in
            return numA + numB
        }
        
        print(closureWithParamasExplicit(43434, 43434))
        
        let myClosure: (String, Int) -> Void = { (name, age) in
            print("Hi, my name is: \(name) and I'm \(age) years old")
        }
        
        myClosure("Yisus", 26)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "SecondViewController" {
            let secondViewController = segue.destination as! SecondViewController
            
            secondViewController.delegate = self
            
//            secondViewController.myClosure = { (text) in
//                print(text)
//            }
            secondViewController.set { textReturned, color in
                print("Text Returned: \(textReturned)")
                self.view.backgroundColor = color
                self.dismiss(animated: true, completion: nil)
            }
            
        }
    }

}

// MARK: - SecondDelegate

extension ViewController: SecondDelegate {
    func secondDidSend(text: String) {
        print("Text received by delegate: \(text)")
        self.dismiss(animated: true) {
            print("Modal was closed")
        }
    }
    
    
}

