//
//  Game.swift
//  UnitTestDemo
//
//  Created by Ismail on 2022-05-14.
//

import Foundation


class Game {
    
    var score = 0
    
    private var questions = [Question]()
    
    var currentIndex = 0
    
    var state: State = .ongoing

    enum State {
        case ongoing, over
    }

    var currentQuestion: Question {
        return questions[currentIndex]
    }
    
    static let questionsLoadedNotifName = Notification.Name(rawValue: "QuestionsLoaded")
    
    static let questionsLoadedNotif = Notification(name: questionsLoadedNotifName)
    
    func refresh() {

        score = 0
        currentIndex = 0
        state = .over
        
    }

    func setGameQuestions(_ questions: [Question]) {
        self.questions = questions
        self.state = .ongoing
    }
    
    func answerCurrentQuestion(with answer: Bool) {
        if (currentQuestion.isCorrect && answer) || (!currentQuestion.isCorrect && !answer) {
            score += 1
        }
        goToNextQuestion()
    }

    public func goToNextQuestion() {
        if currentIndex < questions.count - 1 {
            currentIndex += 1
        } else {
            finishGame()
        }
    }

     func finishGame() {
         state = .over
    }
    
}
