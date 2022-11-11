//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var quizBrain = QuizBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(named: "BACKGROUND")
        setupView()
        setupConstraints()
        updateUI()
        
    }
    func setupView(){
        view.addSubviews(questionLabel,trueButton,falseButton,progressView, bubbleImage,scoreLabel)
        questionLabel.text = quizBrain.getQuesText()
        trueButton.addTarget(self, action: #selector(answerButton), for: .touchUpInside)
        falseButton.addTarget(self, action: #selector(answerButton), for: .touchUpInside)

    }
    
    func setupConstraints(){
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
//            questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            questionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            questionLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            questionLabel.topAnchor.constraint(equalTo: safeArea.topAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            questionLabel.bottomAnchor.constraint(equalTo: trueButton.topAnchor,constant: -20)
        ])
        
        NSLayoutConstraint.activate([
//            trueButton.heightAnchor.constraint(equalTo: falseButton.heightAnchor),
            trueButton.leadingAnchor.constraint(equalTo:safeArea.leadingAnchor, constant: 10),
            trueButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,constant: -10),
            trueButton.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 10)
            
        ])
        
        NSLayoutConstraint.activate([
//            falseButton.heightAnchor.constraint(equalToConstant: 80),
            falseButton.leadingAnchor.constraint(equalTo:safeArea.leadingAnchor, constant: 10),
            falseButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10),
            falseButton.topAnchor.constraint(equalTo: trueButton.bottomAnchor, constant: 10),
            falseButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,constant: 20),
            progressView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,constant: -20),
            progressView.topAnchor.constraint(equalTo: falseButton.bottomAnchor,constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            bubbleImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bubbleImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bubbleImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bubbleImage.topAnchor.constraint(equalTo: falseButton.bottomAnchor,constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            scoreLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,constant: 20),
            scoreLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 40),
            scoreLabel.widthAnchor.constraint(equalToConstant: 100),
            scoreLabel.heightAnchor.constraint(equalToConstant: 30)
        ])

        
    }
    // MARK: - UI
    private var scoreLabel:UILabel = {
       let label = UILabel()
        label.text = "Score:"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var questionLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var trueButton:UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.setTitle("True", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var falseButton:UIButton = {
        let button = UIButton()
        button.contentHorizontalAlignment = .center
        button.layer.cornerRadius = 8
        button.setTitle("False", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.backgroundColor = .clear
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var progressView:UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.setProgress(0.5, animated: true)
        progressView.trackTintColor = .lightGray
        progressView.tintColor = .blue
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    private var bubbleImage:UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "Background-Bubbles")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    // MARK: - Func
    @objc func answerButton(sender:UIButton){
        quizBrain.nextQues()
        let userAns = sender.currentTitle!
        
        if quizBrain.checkAns(userAns: userAns){
            sender.layer.backgroundColor = UIColor.green.cgColor
        }else{
            sender.layer.backgroundColor = UIColor.red.cgColor
        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
//        updateUI()
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuesText()
        trueButton.layer.backgroundColor = UIColor.clear.cgColor
        falseButton.layer.backgroundColor = UIColor.clear.cgColor
        progressView.progress = quizBrain.getProgress()
        scoreLabel.text = "Score:\(quizBrain.getScore())"
    }
}

