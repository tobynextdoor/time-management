//
//  CalendarTests.swift
//  Time Management
//
//  Created by Tobias Wermuth on 19/06/16.
//  Copyright © 2016 Tobias Wermuth. All rights reserved.
//

import XCTest

@testable import Time_Management

class EpisodeCalendarTests: XCTestCase {
  func testInBetweenEventScheduling() {
    let event1 = Event(from: Date(), to: Date(), title: "")
    let event2 = Event(from: event1.to.addingTimeInterval(5), to: event1.to.addingTimeInterval(10), title: "")
    let episodeFrame1 = EpisodeFrame(event: event1)
    let episodeFrame2 = EpisodeFrame(event: event2)
    var calendar = EpisodeCalendar(episodeFrames: [episodeFrame1, episodeFrame2])
    
    let event3 = Event(from: event1.to.addingTimeInterval(2), to: event1.to.addingTimeInterval(4), title: "")
    let episodeFrame3 = EpisodeFrame(event: event3)

    try! calendar.schedule(episode: event3)
    
    let expectedFrames = [episodeFrame1, episodeFrame3, episodeFrame2]
    
    XCTAssertEqual(expectedFrames, calendar.episodeFrames)
  }
  
  func testBeforeEventScheduling() {
    let event1 = Event(from: Date().addingTimeInterval(5), to: Date().addingTimeInterval(5), title: "")
    let event2 = Event(from: event1.to.addingTimeInterval(5), to: event1.to.addingTimeInterval(10), title: "")
    let episodeFrame1 = EpisodeFrame(event: event1)
    let episodeFrame2 = EpisodeFrame(event: event2)
    var calendar = EpisodeCalendar(episodeFrames: [episodeFrame1, episodeFrame2])
    
    let event3 = Event(from: Date(), to: Date(), title: "")
    let episodeFrame3 = EpisodeFrame(event: event3)
    
    try! calendar.schedule(episode: event3)
    
    let expectedFrames = [episodeFrame3, episodeFrame1, episodeFrame2]
    
    XCTAssertEqual(expectedFrames, calendar.episodeFrames)
  }
  
  func testAfterEventScheduling() {
    let event1 = Event(from: Date(), to: Date(), title: "")
    let event2 = Event(from: event1.to.addingTimeInterval(5), to: event1.to.addingTimeInterval(10), title: "")
    let episodeFrame1 = EpisodeFrame(event: event1)
    let episodeFrame2 = EpisodeFrame(event: event2)
    var calendar = EpisodeCalendar(episodeFrames: [episodeFrame1, episodeFrame2])
    
    let event3 = Event(from: event2.to.addingTimeInterval(2), to: event2.to.addingTimeInterval(4), title: "")
    let episodeFrame3 = EpisodeFrame(event: event3)
    
    try! calendar.schedule(episode: event3)
    
    let expectedFrames = [episodeFrame1, episodeFrame2, episodeFrame3]
    
    XCTAssertEqual(expectedFrames, calendar.episodeFrames)
  }
  
  func testFailEncapsulatingEventScheduling() {
    let event1 = Event(from: Date(), to: Date(), title: "")
    let event2 = Event(from: event1.to.addingTimeInterval(5), to: event1.to.addingTimeInterval(10), title: "")
    let episodeFrame1 = EpisodeFrame(event: event1)
    let episodeFrame2 = EpisodeFrame(event: event2)
    var calendar = EpisodeCalendar(episodeFrames: [episodeFrame1, episodeFrame2])
    
    let event3 = Event(from: event2.from.addingTimeInterval(-1), to: event2.to.addingTimeInterval(1), title: "")
      
    
    XCTempAssertThrowsSpecificError(
      kind: EpisodeCalendarError.EventWouldEncapsulateOtherEpisodes,
      block: {try calendar.schedule(episode: event3)})
  }
  
  func testFailEncapsulatedEventScheduling() {
    let event1 = Event(from: Date(), to: Date(), title: "")
    let event2 = Event(from: event1.to.addingTimeInterval(5), to: event1.to.addingTimeInterval(10), title: "")
    let episodeFrame1 = EpisodeFrame(event: event1)
    let episodeFrame2 = EpisodeFrame(event: event2)
    var calendar = EpisodeCalendar(episodeFrames: [episodeFrame1, episodeFrame2])
    
    let event3 = Event(from: event2.from.addingTimeInterval(1), to: event2.to.addingTimeInterval(1), title: "")
    
    
    XCTempAssertThrowsSpecificError(
      kind: EpisodeCalendarError.DateEncapsulatedByEpisodeFrame,
      block: {try calendar.schedule(episode: event3)})
  }
}
