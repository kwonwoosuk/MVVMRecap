//
//  Observable.swift
//  MVVMRecap
//
//  Created by 권우석 on 2/5/25.
//

import Foundation


class Observable<T> {
    
    private var closure: ((T) -> Void)?
    
    var value: T {
        didSet {
            closure?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(closure: @escaping (T) -> Void) {
        closure(value) //  초기값도 사용해야할때
        self.closure = closure
    }
    
    func lazybind(closure: @escaping (T) -> Void) {
        self.closure = closure
    }
    
}
