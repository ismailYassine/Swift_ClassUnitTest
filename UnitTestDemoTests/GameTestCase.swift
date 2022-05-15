//
//  GameTestCase.swift
//  UnitTestDemoTests
//
//  Created by Ismail on 2022-05-14.
//

import XCTest
@testable import UnitTestDemo

class GameTestCase: XCTestCase {
    
    var game = Game()
   
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
         game = Game()
    }
    
    func testGivenTwoTrueQuestions_WhenAnsweringTrue_ThenScoreIsOneAndGameOnGoing(){
        
        game.setGameQuestions(addQuestion(number: 2))
        game.answerCurrentQuestion(with: true)
        
        XCTAssert(game.score == 1, "Test Score is 1 failed")
        XCTAssert(game.state == .ongoing, "Test Game State is onGoing failed")
    }
    
    func testGivenOneTrueQuestion_WhenAnsweringFalse_ThenScoreIs0AndGameOver(){
        
        game.setGameQuestions(addQuestion(number: 1))
        game.answerCurrentQuestion(with: false)
        
        XCTAssert(game.score == 0, "Test Score is 0 failed")
        XCTAssert(game.state == .over, "Test Game State is over failed")
    }
    
    func testGivenOneTrueQuestion_WhenAnsweringTrue_ThenScoreIs1AndGameOver(){
        
        game.setGameQuestions(addQuestion(number: 1))
        game.answerCurrentQuestion(with: true)
        
        XCTAssert(game.score == 1, "Test Score is 1 failed")
        XCTAssert(game.state == .over, "Test Game State is over failed")
    }
    
    func testGivenEmptyQuestionnaire_WhenSetGameQuestions_ThenGameIsOnGoingAndCurrentQuestionMatchesExcpectedTitle(){
        
        let question = Question()
        let questions = [question]
        
        game.setGameQuestions(questions)
        
        XCTAssert(game.state == .ongoing, "Test Game State is ongoing failed")
        XCTAssert(game.currentQuestion.title == question.title, "Test Question title as expected failed")
    }
    
}
    
    
    
    
    
    
    
    
    func testGivenGameIsOver_WhenGameIsRefreshed_ThenScoreIsZeroCurrentIndexIsZeroAndStateIsOver(){
        
        game.state = .over
        game.refresh()
        
        XCTAssert(game.score == 0, "Test Score is 0 failed")
        XCTAssert(game.currentIndex == 0, "Test currentIndex is 0 failed")
        XCTAssert(game.state == .over, "Test Game State is over failed")
    }
    
    func addQuestion(number: Int) -> [Question]{
            
        var questions = [Question]()
            
        for index in 0..<number{
        let question = Question(title: "Question\(index)", isCorrect: true)
            questions.append(question)
        }
            return questions
    }
}



