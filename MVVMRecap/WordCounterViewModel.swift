//
//  wordCounterViewModel.swift
//  MVVMRecap
//
//  Created by 권우석 on 2/5/25.
//

import Foundation

class WordCounterViewModel {
    
    var inputText: Observable<String?> = Observable(nil)
    var outputText = Observable("")

    init() {
        inputText.bind { text in
            self.validation()
        }
    }
    
    private func validation() {
        
        if let text = inputText.value {
            let count = text.count
            outputText.value = "현재까지 \(count)글자 작성중"
        }
    }
    
    
}
