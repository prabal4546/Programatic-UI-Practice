//
//  ViewController.swift
//  Programmatic-UI
//
//  Created by Prabaljit Walia on 07/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    let nextButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpButton()
        setupConstraints()
        view.backgroundColor = .systemBackground
        title = "First Screen"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setUpButton(){
        view.addSubview(nextButton)
        nextButton.configuration = .filled()
        nextButton.configuration?.baseBackgroundColor = .systemPink
        nextButton.configuration?.title = "Next"
        nextButton.addTarget(self, action: #selector(goToNextScreen ), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func goToNextScreen(){
        let nextScreen = SecondScreen()
        navigationController?.pushViewController(nextScreen, animated: true )
    }


}

