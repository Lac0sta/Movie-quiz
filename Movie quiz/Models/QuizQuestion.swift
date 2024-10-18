//
//  QuizQuestion.swift
//  Movie quiz
//
//  Created by Aleksei Frolov on 02.10.2024.
//

import Foundation

struct QuizQuestion {
    // The movie title, matches the movie poster image name in Assets
    let movieImage: String
    // Question about the movie rating
    let questionText: String
    // The correct answer to the question
    let isCorrectAnswer: Bool
}
