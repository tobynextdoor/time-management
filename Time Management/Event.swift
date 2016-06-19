//
//  Event.swift
//  Time Management
//
//  Created by Tobias Wermuth on 19/06/16.
//  Copyright © 2016 Tobias Wermuth. All rights reserved.
//

import Foundation

struct Event: Episodable, Equatable {  
  var from: Date
  var to: Date
  
  var title: String
  var description: String?
  
  
  init(from: Date, to: Date, title: String) {
    self.from = from
    self.to = to
    self.title = title
  }
  
  func duration() -> TimeInterval {
    return frameDuration()
  }
}

func ==(lhs: Event, rhs: Event) -> Bool {
  let areEqual = lhs.from == rhs.from &&
    lhs.to == rhs.to &&
    lhs.title == rhs.title &&
    lhs.description == rhs.description
  
  return areEqual
}
