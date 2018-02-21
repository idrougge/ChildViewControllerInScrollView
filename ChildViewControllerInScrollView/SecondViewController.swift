//
//  SecondViewController.swift
//  ChildViewControllerInScrollView
//
//  Created by Iggy Drougge on 2018-02-21.
//

import UIKit

class SecondViewController: UIViewController, Scrollable, Containable {

    @IBOutlet weak var innerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func didPressTop(_ sender: Any) {
        print(type(of: self), #function)
    }
    @IBAction func didPressMiddle(_ sender: Any) {
        print(type(of: self), #function)
    }
    @IBAction func didPressBottom(_ sender: Any) {
        print(type(of: self), #function)
    }
    
}
