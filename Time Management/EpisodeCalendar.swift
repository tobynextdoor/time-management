//
//  Calendar.swift
//  Time Management
//
//  Created by Tobias Wermuth on 19/06/16.
//  Copyright © 2016 Tobias Wermuth. All rights reserved.
//

import Foundation

struct EpisodeCalendar {
  var episodeFrames: [EpisodeFrame]
  
  mutating func schedule(episode: Episodable) throws {
    if let intent = episode as? Intent {
      try scheduleIntent(intent: intent)
    } else if let event = episode as? Event {
      try scheduleEvent(event: event)
    } else {
      throw EpisodeCalendarError.UnkownEpisodableType
    }
  }
  
  private mutating func scheduleEvent(event: Event) throws {
    let fromIndex = try findIndexFor(date: event.from)
    let toIndex = try findIndexFor(date: event.to)
    
    if (fromIndex == toIndex) {
      let episodeFrame = EpisodeFrame(event: event)
      episodeFrames.insert(episodeFrame, at: fromIndex)
    } else {
      throw EpisodeCalendarError.EventWouldEncapsulateOtherEpisodes
    }
  }
  
  private mutating func scheduleIntent(intent: Intent) throws {
  }
  
  private func findIndexFor(date: Date) throws -> Int {
    if (episodeFrames.isEmpty || episodeFrames.first!.from > date) {
      return 0
    }
    for (index, _) in episodeFrames.enumerated() {
      if(episodeFramesAtIndexContainDate(index: index, date: date)) {
        return index + 1
      }
    }
    throw EpisodeCalendarError.DateEncapsulatedByEpisodeFrame
  }
  
  private func episodeFramesAtIndexContainDate(index: Int, date: Date) -> Boolean {
    let episodeFrame = episodeFrames[index]
    if (episodeFrame.to < date) {
      if (episodeFrames.count > index + 1) {
        let nextEpisodeFrame = episodeFrames[index + 1]
        if (nextEpisodeFrame.from > date) {
          return true
        }
      } else {
        return true
      }
    }
    return false
  }
}

enum EpisodeCalendarError: ErrorProtocol {
  case DateEncapsulatedByEpisodeFrame
  case EventWouldEncapsulateOtherEpisodes
  case UnkownEpisodableType
}
