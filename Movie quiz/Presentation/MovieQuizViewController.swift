//
//  MovieQuizViewController.swift
//  Movie quiz
//
//  Created by Aleksei Frolov on 18.08.2024.
//

import UIKit

final class MovieQuizViewController: UIViewController {
    
    private let questionAmount: Int = 10
    private var currentQuestionIndex = 0
    private var correctAnswers = 0
    private var questionGenerator: QuestionGenerator = QuestionGenerator()
    private var currentQuestion: QuizQuestion?
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private var counterLabel: UILabel!
    @IBOutlet private var yesButton: UIButton!
    @IBOutlet private var noButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let firstQuestion = questionGenerator.requestNextQuestion() {
            currentQuestion = firstQuestion
            let viewModel = convert(model: firstQuestion)
            showQuestion(quiz: viewModel)
        }
    }
    
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
        let givenAnswer = true
        
        guard let currentQuestion else { return }
        showAnswerResult(isCorrect: currentQuestion.isCorrectAnswer == givenAnswer)
    }
    
    @IBAction private func noButtonClicked(_ sender: UIButton) {
        let givenAnswer = false
        
        guard let currentQuestion else { return }
        showAnswerResult(isCorrect: currentQuestion.isCorrectAnswer == givenAnswer)
    }
    
    private func convert(model: QuizQuestion) -> QuizStepViewModel {
        let questionStep = QuizStepViewModel(
            image: UIImage(named: model.movieImage) ?? UIImage(),
            question: model.questionText,
            questionNumber: "\(currentQuestionIndex + 1)/\(questionAmount)")
        return questionStep
    }
    
    private func showQuestion(quiz step: QuizStepViewModel) {
        counterLabel.text = step.questionNumber
        imageView.image = step.image
        textLabel.text = step.question
        
        imageView.layer.borderWidth = 0
    }
    
    private func showAnswerResult(isCorrect: Bool) {
        answerButtonsEnabled(isEnabled: false)
        
        if isCorrect {
            correctAnswers += 1
        }
        
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        imageView.layer.cornerRadius = 20
        imageView.layer.borderColor = isCorrect ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else { return }
            self.showNextQuestionOrResult()
        }
    }
    
    private func showNextQuestionOrResult() {
        if currentQuestionIndex == questionAmount - 1 {
            
            showAlertWith(result: QuizResultViewModel(title: "This round is finished",
                                                      text: "Your score is \(correctAnswers)",
                                                      butonText: "Play again"))
            
        } else {
            currentQuestionIndex += 1
            if let nextQuestion = questionGenerator.requestNextQuestion() {
                currentQuestion = nextQuestion
                let viewModel = convert(model: nextQuestion)
                showQuestion(quiz: viewModel)
            }
            answerButtonsEnabled(isEnabled: true)
        }
    }
    
    private func showAlertWith(result model: QuizResultViewModel) {
        let alert = UIAlertController(title: model.title,
                                      message: model.text,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: model.butonText, style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.currentQuestionIndex = 0
            self.correctAnswers = 0
            
            if let firstQuestion = self.questionGenerator.requestNextQuestion() {
                self.currentQuestion = firstQuestion
                let viewModel = self.convert(model: firstQuestion)
                self.showQuestion(quiz: viewModel)
            }
            self.answerButtonsEnabled(isEnabled: true)
        }
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func answerButtonsEnabled(isEnabled: Bool) {
        yesButton.isEnabled = isEnabled
        noButton.isEnabled = isEnabled
    }
}
