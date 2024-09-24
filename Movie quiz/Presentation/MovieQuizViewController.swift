//
//  MovieQuizViewController.swift
//  Movie quiz
//
//  Created by Aleksei Frolov on 18.08.2024.
//

import UIKit

struct QuizQuestion {
    // The movie title, matches the movie poster image name in Assets
    let movieImage: String
    // Question about the movie rating
    let questionText: String
    // The correct answer to the question
    let isCorrectAnswer: Bool
}

// View model for the "Question is shown" state
struct QuizStepViewModel {
    // The movie poster of type UIImage
    let image: UIImage
    // Question about the quiz rating
    let question: String
    // The ordinal number of the question (e.g., "1/10")
    let questionNumber: String
}

// View model for the "Quiz Result" state
struct QuizResultViewModel {
    // The alert title
    let title: String
    // The text about the number of points scored
    let text: String
    // The text for the alert button
    let butonText: String
}

final class MovieQuizViewController: UIViewController {
    
    private let questions: [QuizQuestion] = [
        QuizQuestion(
            movieImage: "The Godfather",
            questionText: "Is the rating of this movie more than 6?", // Rating: 9,2
            isCorrectAnswer: true),
        QuizQuestion(
            movieImage: "The Dark Knight",
            questionText: "Is the rating of this movie more than 6?", // Rating: 9
            isCorrectAnswer: true),
        QuizQuestion(
            movieImage: "Kill Bill",
            questionText: "Is the rating of this movie more than 6?", // Rating: 8,1
            isCorrectAnswer: true),
        QuizQuestion(
            movieImage: "The Avengers",
            questionText: "Is the rating of this movie more than 6?", // Rating: 8
            isCorrectAnswer: true),
        QuizQuestion(
            movieImage: "Deadpool",
            questionText: "Is the rating of this movie more than 6?", // Rating: 8
            isCorrectAnswer: true),
        QuizQuestion(
            movieImage: "The Green Knight",
            questionText: "Is the rating of this movie more than 6?", // Rating: 6,6
            isCorrectAnswer: true),
        QuizQuestion(
            movieImage: "Old",
            questionText: "Is the rating of this movie more than 6?", // Rating: 5,8
            isCorrectAnswer: false),
        QuizQuestion(
            movieImage: "The Ice Age Adventures of Buck Wild",
            questionText: "Is the rating of this movie more than 6?", // Rating: 4.3
            isCorrectAnswer: false),
        QuizQuestion(
            movieImage: "Tesla",
            questionText: "Is the rating of this movie more than 6?", // Rating: 5,1
            isCorrectAnswer: false),
        QuizQuestion(
            movieImage: "Vivarium",
            questionText: "Is the rating of this movie more than 6?", // Rating: 5,8
            isCorrectAnswer: false)
    ]
    private var currentQuestionIndex = 0
    private var correctAnswers = 0
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private var counterLabel: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showQuestion(quiz: convert(model: questions[currentQuestionIndex]))
    }
    
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
        let givenAnswer = true
        showAnswerResult(isCorrect: questions[currentQuestionIndex].isCorrectAnswer == givenAnswer)
    }
    
    @IBAction private func noButtonClicked(_ sender: UIButton) {
        let givenAnswer = false
        showAnswerResult(isCorrect: questions[currentQuestionIndex].isCorrectAnswer == givenAnswer)
    }
    
    private func convert(model: QuizQuestion) -> QuizStepViewModel {
        let questionStep = QuizStepViewModel(
            image: UIImage(named: model.movieImage) ?? UIImage(),
            question: model.questionText,
            questionNumber: "\(currentQuestionIndex + 1)/\(questions.count)")
        return questionStep
    }
    
    private func showQuestion(quiz step: QuizStepViewModel) {
        counterLabel.text = step.questionNumber
        imageView.image = step.image
        textLabel.text = step.question
    }
    
    private func showAnswerResult(isCorrect: Bool) {
        
        if isCorrect {
            correctAnswers += 1
        }
        
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        imageView.layer.cornerRadius = 20
        imageView.layer.borderColor = isCorrect ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.showNextQuestionOrResult()
        }
    }
    
    private func showNextQuestionOrResult() {
        if currentQuestionIndex == questions.count - 1 {
            
            showAlertWith(result: QuizResultViewModel(title: "This round is finished",
                                                      text: "Your score is \(correctAnswers)",
                                                      butonText: "Play again"))
            
        } else {
            currentQuestionIndex += 1
            showQuestion(quiz: convert(model: questions[currentQuestionIndex]))
        }
    }
    
    private func showAlertWith(result model: QuizResultViewModel) {
        let alert = UIAlertController(title: model.title,
                                      message: model.text,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: model.butonText, style: .default) { _ in
            self.currentQuestionIndex = 0
            self.correctAnswers = 0
            self.showQuestion(quiz: self.convert(model: self.questions[self.currentQuestionIndex]))
        }
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
