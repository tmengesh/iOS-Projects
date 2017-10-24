//
//  unitTestExampleTests.swift
//  unitTestExampleTests
//
//  Created by Koulutus on 22/10/2017.
//  Copyright © 2017 Tewodros Mengesha. All rights reserved.
//

import XCTest
@testable import unitTestExample

class unitTestExampleTests: XCTestCase {
    
    let viewController = ViewController()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIsNumberEven()
    {
        let testNum = 6
        let testNum2 = 7
        XCTAssertTrue(viewController.isNumberEven(num: testNum))
        XCTAssertFalse(viewController.isNumberEven(num: testNum2))
    }
    
    func testFibonacci()
    {
        let givenNum = 10
        XCTAssertEqual(viewController.fibonacci(n: givenNum), 55)
        
    }
    
}
