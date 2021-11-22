//
//  GalgjeEngine.swift
//  Galgje
//
//  Created by docent on 17/11/2021.
//

import Foundation

class GalgjeEngine {
    var word : String
    var wrongAttempts : Int
    var foundLetters : [String]
    var Attempts : Int
    var currImage : String
    var woordArray: [String]
    
    init(newWord : String) {
        word = newWord
        wrongAttempts = 0
        Attempts = 0;
        foundLetters = []
        currImage = "";
        
        woordArray = [];
        var i = 0;
        while(i<newWord.count)
        {
            woordArray.append("_")
            i += 1;
            
        }
    }
    func getWoord() -> String
    {
        return word
    }
    func getMawWrongAttemps() -> Int
    {
        return wrongAttempts
    }
    func startSpel(woord: String) -> Bool
    {
        word = woord
        wrongAttempts = 0;
        Attempts = 0;
        foundLetters = []
        currImage = "";
        return true
    }
    func speel(letter:String) -> (correct: Bool, numberOfWrongAttempts:
         Int, woordArray: [String], image:String)
    {
        var doesWordContainLetter = word.contains(letter)
        
        
        
        
        
        
        
        if(wrongAttempts>=10)
        {
            if !doesWordContainLetter {
                wrongAttempts += 1
                
                
            
            }
            else
            {
                foundLetters.append(letter)
                
                
            }
            
            
        }
        
        
        if(doesWordContainLetter)
        {
            //indexen van letter in woord
            var indexsOfWord : [Int] = []
            var i = 0;
            while(i < getWoord().count)
            {
                if(Array(arrayLiteral: getWoord())[i] == letter)
                {
                    indexsOfWord.append(i)
                }
            }
            //toevoegen letters in woordarray
            for indexOfletter in woordArray
            {
                woordArray[Int(indexOfletter)!] == letter
            }
        }
        
        
        
        
        
        var isCorrect = true;
        for item in getWoord() {
            if(!foundLetters.contains(String(item)))
            {
                isCorrect = false
            }
        }
        Attempts += 1
        currImage = "galgje"+String(wrongAttempts)
        return (isCorrect,getMawWrongAttemps(),foundLetters,currImage)
    
        
    }
    
    
}
