//
//  QuestionGenerator.swift
//  Movie quiz
//
//  Created by Aleksei Frolov on 02.10.2024.
//

import Foundation

final class QuestionGenerator {
    
    let questions: [QuizQuestion] = [
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
    
    func requestNextQuestion() -> QuizQuestion? {
        guard let index = (0...questions.count).randomElement() else {
            return nil
        }
        return questions[safe: index]
    }
    
}
