//
//  WelcomeScreenViewController.swift
//  Homework_2.3
//
//  Created by Дарья Яровая on 25.05.2021.
//

import UIKit

class WelcomeScreenViewController: UIViewController {
    
    @IBOutlet weak var welcomePhraseLabel: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomePhraseLabel.text = "Welcome, \(userName) 🖐"
        logOutButton.layer.cornerRadius = 5
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    @IBAction func pressedLogOutButton() {
        dismiss(animated: true)
    }
}
