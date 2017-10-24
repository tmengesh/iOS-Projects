//
//  main.swift
//  LottoExercise
//
//  Created by Tewodros Mengesha on 19/09/2017.
//  Copyright © 2017 Tewodros Mengesha. All rights reserved.
//

import Foundation

print("******** Lotto ******* ")
print(" Today's winning numbers are: ")
var lotteryPool = [Int]()

for iter in 0..<8{
    var flag: Bool = false
    while(!flag)
    {
        let randomNumber = Int(arc4random_uniform(40)) + 1;
        
        if(!lotteryPool.contains(randomNumber))
        {
            lotteryPool.append(randomNumber)
            flag = true;
        }
    }
}
lotteryPool = lotteryPool.sorted()

for element in lotteryPool {
    print(element, terminator: " ")
}

