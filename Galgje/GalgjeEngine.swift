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
        word = newWord.uppercased()
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
        
        var doesWordContainLetter = self.word.contains(letter)
        
        
        
        
        
        
        
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
            if(!foundLetters.contains(letter))
            {
                foundLetters.append(letter);
                //indexen van letter in woord
                var indexsOfWord : [Int] = []
                var i = 0;
                while(i < getWoord().count)
                {
                    var charactersOfWord = word.map { String($0) }
                    if(charactersOfWord[i] == letter)
                    {
                        indexsOfWord.append(i)
                    }
                    i += 1 ;
                }
                //toevoegen letters in woordarray
                
                for indexWord in indexsOfWord
                {
                    woordArray[indexWord] = letter
                }
            }
            
            
        }
        else
        {
            wrongAttempts += 1;
        }
        
        
        
        
        
        var isCorrect = true;
        for item in getWoord() {
            if(!foundLetters.contains(String(item)))
            {
                isCorrect = false
            }
        }
        Attempts += 1
        if(getMawWrongAttemps() == 0)
        {
            currImage = "galgje"
        }
        else
        {
            currImage = "galgje"+String(wrongAttempts)
        }
        
        return (isCorrect,getMawWrongAttemps(),woordArray,currImage)
    
        
    }
    
    
}
