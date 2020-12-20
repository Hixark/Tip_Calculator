//
//  ViewController.swift
//  TipCalculator
//
//  Created by SOIS on 5/9/20.
//  Copyright © 2020 Khari Golson. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var mealCost: UITextField!
    @IBOutlet weak var tipAmount: UITextField!
    @IBOutlet weak var billAmount: UILabel!
    
    @IBAction func Calculate(_ sender: Any) {
        
        billAmount.text = mealCost.text
        //Resign First responder
        mealCost.resignFirstResponder()
        tipAmount.resignFirstResponder()
    
        let a : Double = NSString(string: mealCost.text!).doubleValue
        let b : Double = NSString(string: tipAmount.text!).doubleValue
        
        //  we checking against 0.0, because above function return 0.0 if it gets failed to convert
        if (a != 0.0) && (b != 0.0 ) {
            let ans = a * (1+(b/100))
            billAmount.text = "\(ans)"
            
            print("Meal Cost: " + mealCost.text!)
            print("Tip Amount: " + tipAmount.text!)
            
        } else {
            
            let alertController = UIAlertController(title: "Error", message:
                "Input values are not numberic", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default,
                                                    handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Tap inside App
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //Done Button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mealCost.resignFirstResponder()
        tipAmount.resignFirstResponder()
        return false
    }
    


}

