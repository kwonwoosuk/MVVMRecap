//
//  CurrencyViewModel.swift
//  MVVMRecap
//
//  Created by 권우석 on 2/5/25.
//

import Foundation

class CurrencyViewModel {
    
//    var inputAmount: Observable<Int?> = Observable(nil) 바꿔서 넘겨줄거면 넌 뭐하러 있냐?
    var inputAmount: Observable<String?> = Observable(nil)
//    var convertButtonTapped = Observable(())
    var outputText = Observable("")
    
    init() {
        inputAmount.bind { currency in
            print("inputAmount:", currency)
            self.validation()
        }
    }
    
    
    private func validation() {
        
        guard let currency = inputAmount.value,
              let amount = Double(currency) else {
            outputText.value = "올바른 금액을 입력해주세요"
            return
        }
        
        let exchangeRate = 1445.0 // 실제 환율 데이터로 대체 필요
        let convertedAmount = amount / exchangeRate
        outputText.value = String(format: "%.2f USD (약 $%.2f)", convertedAmount, convertedAmount)
    }
}
