//
//  ViewController.swift
//  toolbartest
//
//  Created by Aaron Satterfield on 9/22/17.
//  Copyright © 2017 Aaron Satterfield. All rights reserved.
//

import UIKit



extension UIButton {
    
    static func nextButton() -> UIButton {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 40.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        button.tintColor = .white
        button.isUserInteractionEnabled = true
        button.setBackgroundImage(UIImage.image(with: UIColor.red), for: .normal)
        button.setBackgroundImage(UIImage.image(with: UIColor.red.withAlphaComponent(0.5)), for: .disabled)
        button.setAttributedTitle(NSAttributedString(string: "Next", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16.0)]), for: .normal)
        return button
    }
}

extension UIImage {
    
    static func image(with color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let view = UIView(frame: CGRect(x: 20, y: 0, width: UIScreen.main.bounds.width-40.0, height: 44.0))
        let nextButton = UIButton.nextButton()
        nextButton.addTarget(self, action: #selector(self.didSelect), for: .touchUpInside)
        view.addSubview(nextButton)
        nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        let nextItem = UIBarButtonItem(customView: view)
        setToolbarItems([nextItem], animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func didSelect() {
        print("it works!!")
    }


}

