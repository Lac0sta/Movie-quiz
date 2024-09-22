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

final class MovieQuizViewController: UIViewController {
    
    private let questions: [QuizQuestion] = [
        QuizQuestion(
            movieImage: "The Godfather",
            questionText: "Is the rating of this movie more than 6?",
            isCorrectAnswer: true),
        QuizQuestion(
            movieImage: "The Dark Knight",
            questionText: "Is the rating of this movie more than 6?",
            isCorrectAnswer: true),
        QuizQuestion(
            movieImage: "Kill Bill",
            questionText: "Is the rating of this movie more than 6?",
            isCorrectAnswer: true),
        QuizQuestion(
            movieImage: "The Avengers",
            questionText: "Is the rating of this movie more than 6?",
            isCorrectAnswer: true),
        QuizQuestion(
            movieImage: "Deadpool",
            questionText: "Is the rating of this movie more than 6?",
            isCorrectAnswer: true),
        QuizQuestion(
            movieImage: "The Green Knight",
            questionText: "Is the rating of this movie more than 6?",
            isCorrectAnswer: true),
        QuizQuestion(
            movieImage: "Old",
            questionText: "Is the rating of this movie more than 6?",
            isCorrectAnswer: false),
        QuizQuestion(
            movieImage: "The Ice Age Adventures of Buck Wild",
            questionText: "Is the rating of this movie more than 6?",
            isCorrectAnswer: false),
        QuizQuestion(
            movieImage: "Tesla",
            questionText: "Is the rating of this movie more than 6?",
            isCorrectAnswer: false),
        QuizQuestion(
            movieImage: "Vivarium",
            questionText: "Is the rating of this movie more than 6?",
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
        
    }
    
    @IBAction private func noButtonClicked(_ sender: UIButton) {
        
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
    
    
}

/*
 Mock-data
 
 Picture: The Godfather
 Rating: 9,2
 Question: Is the rating of this movie more than 6?
 Answer: YES
 
 
 Picture: The Dark Knight
 Rating: 9
 Question: Is the rating of this movie more than 6?
 Answer: YES
 
 
 Picture: Kill Bill
 Rating: 8,1
 Question: Is the rating of this movie more than 6?
 Answer: YES
 
 
 Picture: The Avengers
 Rating: 8
 Question: Is the rating of this movie more than 6?
 Answer: YES
 
 
 Picture: Deadpool
 Rating: 8
 Question: Is the rating of this movie more than 6?
 Answer: YES
 
 
 Picture: The Green Knight
 Rating: 6,6
 Question: Is the rating of this movie more than 6?
 Answer: YES
 
 
 Picture: Old
 Rating: 5,8
 Question: Is the rating of this movie more than 6?
 Answer: NO
 
 
 Picture: The Ice Age Adventures of Buck Wild
 Rating: 4,3
 Question: Is the rating of this movie more than 6?
 Answer: NO
 
 
 Picture: Tesla
 Rating: 5,1
 Question: Is the rating of this movie more than 6?
 Answer: NO
 
 
 Picture: Vivarium
 Rating: 5,8
 Question: Is the rating of this movie more than 6?
 Answer: NO
 */
