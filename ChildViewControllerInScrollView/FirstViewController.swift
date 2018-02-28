//
//  FirstViewController.swift
//  ChildViewControllerInScrollView
//
//  Created by Iggy Drougge on 2018-02-21.
//

import UIKit

class FirstViewController: UIViewController, Scrollable, Containable {

    @IBOutlet weak var innerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func didPressTop(_ sender: Any) {
        print(type(of: self), #function)
        let second = storyboard!.instantiateViewController(withIdentifier: "second")
        parent?.addChildViewController(second)
        parent?.transition(from: self, to: second, duration: 2, options: UIViewAnimationOptions.transitionCrossDissolve, animations: nil, completion: {success in print("Transitioned successfully: \(success)")})
    }
    @IBAction func didPressMiddle(_ sender: Any) {
        print(type(of: self), #function)
    }
    @IBAction func didPressBottom(_ sender: Any) {
        print(type(of: self), #function)
    }
    

}
