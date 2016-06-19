//
//  EventTests.swift
//  Time Management
//
//  Created by Tobias Wermuth on 19/06/16.
//  Copyright © 2016 Tobias Wermuth. All rights reserved.
//

import Foundation

import XCTest
@testable import Time_Management

class EventTests: XCTestCase {
  func testFrameDuration() {
    let duration = TimeInterval(10)
    let event = createTestEvent(frameDuration: duration)
    XCTAssertEqual(duration, event.frameDuration())
  }
  
  func testDuration() {
    let duration = TimeInterval(10)
    let event = createTestEvent(frameDuration: duration)
    XCTAssertEqual(duration, event.duration())
  }
  
  func createTestEvent(frameDuration: TimeInterval) -> Event {
    return Event(
      from: Date(),
      to: Date().addingTimeInterval(frameDuration),
      title: "")
  }
}
