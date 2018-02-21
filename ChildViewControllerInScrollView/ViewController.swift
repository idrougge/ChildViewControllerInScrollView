//
//  ViewController.swift
//  ChildViewControllerInScrollView
//
//  Created by Iggy Drougge on 2018-02-21.
//

import UIKit

protocol Scrollable {
    var scrollableSize:CGSize {get}
}
protocol Containable {
    weak var innerView:UIView! {get}
}
extension Scrollable where Self: Containable {
    var scrollableSize: CGSize {
        get {
            return innerView.systemLayoutSizeFitting(CGSize(width: innerView.frame.width, height: CGFloat.infinity),
                                                     withHorizontalFittingPriority: .required,
                                                     verticalFittingPriority: .fittingSizeLevel)
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    
    lazy var firstVC:FirstViewController! = storyboard?.instantiateViewController(withIdentifier: "first") as! FirstViewController
    lazy var secondVC:SecondViewController! = storyboard?.instantiateViewController(withIdentifier: "second") as! SecondViewController
    
    var currentSubViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func didSwitchSegment(_ sender: UISegmentedControl) {
        print(#function, sender.selectedSegmentIndex)
        switch sender.selectedSegmentIndex {
        case 0:
            presentSubViewController(firstVC)
            scrollView.contentSize = CGSize(width: self.view.frame.width, height: 980)
        case 1:
            presentSubViewController(secondVC)
            scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        default: fatalError()
        }
        
    }
    
    func presentSubViewController(_ new: UIViewController) {
        let old = currentSubViewController
        old?.willMove(toParentViewController: nil)
        containerView.subviews.last?.removeFromSuperview()
        old?.removeFromParentViewController()
        self.addChildViewController(new)
        new.didMove(toParentViewController: self)
        containerView.addSubview(new.view)
        currentSubViewController = new
        
        if let new = new as? Scrollable & Containable {
            print(#function, "new view is Scrollable & Containable with size", new.scrollableSize)
        }
    }
}

