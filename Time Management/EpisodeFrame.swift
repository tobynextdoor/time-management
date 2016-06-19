//
//  EpisodableFrame.swift
//  Time Management
//
//  Created by Tobias Wermuth on 19/06/16.
//  Copyright © 2016 Tobias Wermuth. All rights reserved.
//

import Foundation

struct EpisodeFrame: TimeFramable, Equatable {
  var from: Date
  var to: Date
  
  var episode: Episodable
  
  init(event: Event) {
    from = event.from
    to = event.to
    episode = event
  }
}

func ==(lhs: EpisodeFrame, rhs: EpisodeFrame) -> Bool {
  let areEqual = lhs.from == rhs.from &&
    lhs.to == rhs.to &&
    lhs.episode == rhs.episode
  
  return areEqual
}
