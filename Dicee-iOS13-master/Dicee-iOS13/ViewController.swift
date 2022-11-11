//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addBackground()
        setupView()
        setupConstraints()
    }
    
    // FIXME: - redundant repetitions
    private var diceLogo:UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "DiceeLogo")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var dice1:UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "DiceOne")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var dice2:UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "DiceTwo")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var dice3:UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "DiceThree")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var dice4:UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "DiceFour")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var dice5:UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "DiceFive")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var dice6:UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "DiceSix")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: - Button
    private var rollButton:UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = .systemRed
        button.configuration?.title = "Roll"
        button.addTarget(self, action: #selector(diceRoll), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func diceRoll(){
        let diceFaces:[String] = ["DiceOne","DiceTwo","DiceThree","DiceFour","DiceFive","DiceSix"]
        dice1.image = UIImage(named: diceFaces.randomElement() ?? "DiceOne")
        dice2.image = UIImage(named: diceFaces.randomElement() ?? "DiceOne")
    }
    
    func setupView(){
        view.addSubviews(diceLogo,dice1,dice2,rollButton)
    }
    func setupConstraints(){
        let safeArea = view.safeAreaLayoutGuide
        let padding:CGFloat = 20
        NSLayoutConstraint.activate([
            diceLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            diceLogo.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: padding),
            diceLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 100),
            diceLogo.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -100)
        ])
        NSLayoutConstraint.activate([
            dice1.topAnchor.constraint(equalTo: diceLogo.bottomAnchor, constant: 60),
            dice1.heightAnchor.constraint(equalToConstant: 120),
            dice1.widthAnchor.constraint(equalToConstant: 120),
            dice1.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding)
        ])
        NSLayoutConstraint.activate([
            dice2.topAnchor.constraint(equalTo: diceLogo.bottomAnchor, constant: 60),
            dice2.heightAnchor.constraint(equalToConstant: 120),
            dice2.widthAnchor.constraint(equalToConstant: 120),
            dice2.leadingAnchor.constraint(equalTo: dice1.trailingAnchor,constant: padding)
        ])
        NSLayoutConstraint.activate([
            rollButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rollButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rollButton.heightAnchor.constraint(equalToConstant: 50),
            rollButton.widthAnchor.constraint(equalToConstant: 100),
            rollButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 500)
        ])
        
//        NSLayoutConstraint.activate([
//            dice3.topAnchor.constraint(equalTo: dice1.bottomAnchor, constant: 20),
//            dice3.heightAnchor.constraint(equalToConstant: 120),
//            dice3.widthAnchor.constraint(equalToConstant: 120),
//            dice3.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding)
//        ])
//
//        NSLayoutConstraint.activate([
//            dice4.topAnchor.constraint(equalTo: dice2.bottomAnchor, constant: 20),
//            dice4.heightAnchor.constraint(equalToConstant: 120),
//            dice4.widthAnchor.constraint(equalToConstant: 120),
//            dice4.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -100)
//        ])
//        NSLayoutConstraint.activate([
//            dice5.topAnchor.constraint(equalTo: dice3.bottomAnchor, constant: 20),
//            dice5.heightAnchor.constraint(equalToConstant: 120),
//            dice5.widthAnchor.constraint(equalToConstant: 120),
//            dice5.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding)
//        ])
//        NSLayoutConstraint.activate([
//            dice6.topAnchor.constraint(equalTo: dice4.bottomAnchor, constant: 20),
//            dice6.heightAnchor.constraint(equalToConstant: 120),
//            dice6.widthAnchor.constraint(equalToConstant: 120),
//            dice6.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -100)
//        ])
    }
}

