//
//  IntentTests.swift
//  Time Management
//
//  Created by Tobias Wermuth on 19/06/16.
//  Copyright © 2016 Tobias Wermuth. All rights reserved.
//

import XCTest
@testable import Time_Management

class IntentTests: XCTestCase {
  func testFrameDuration() {
    let duration = TimeInterval(10)
    let length = TimeInterval(5)
    let intent = createTestIntent(frameDuration: duration, length: length)
    XCTAssertEqual(duration, intent.frameDuration())
  }
  
  func testDuration() {
    let duration = TimeInterval(10)
    let length = TimeInterval(5)
    let intent = createTestIntent(frameDuration: duration, length: length)
    XCTAssertEqual(length, intent.duration())
  }
  
  func createTestIntent(frameDuration: TimeInterval, length: TimeInterval) -> Intent {
    return Intent(
      from: Date(),
      to: Date().addingTimeInterval(frameDuration),
      title: "",
      length: length,
      importance: 1.0)
  }
}
