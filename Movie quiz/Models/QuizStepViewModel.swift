//
//  QuizStepViewModel.swift
//  Movie quiz
//
//  Created by Aleksei Frolov on 02.10.2024.
//

import UIKit

// View model for the "Question is shown" state
struct QuizStepViewModel {
    // The movie poster of type UIImage
    let image: UIImage
    // Question about the quiz rating
    let question: String
    // The ordinal number of the question (e.g., "1/10")
    let questionNumber: String
}
