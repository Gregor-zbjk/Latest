//
//  Observable.swift
//  Latest
//
//  Created by Max Langer on 20.01.22.
//  Copyright © 2022 Max Langer. All rights reserved.
//

import Foundation

/// A uniquely identifiable observer.
@available(macOS, deprecated: 10.15, renamed: "Identifiable")
protocol Observer {
	
	/// The identifier of the observer.
	var id: UUID { get }
	
}

/// An observable object.
protocol Observable {
	
	/// The handler called when an observation is notified.
	typealias ObservationHandler = () -> Void
	
	/// The list of observers.
	var observers: [UUID: ObservationHandler] { get set }

	/// Adds the observer with the given handler to the list of observers.
	mutating func add(_ observer: Observer, handler: @escaping ObservationHandler)
	
	/// Removes the given observer from the list.
	mutating func remove(_ observer: Observer)
	
	/// Notifies the observers of an observation.
	func notify()
		
}

extension Observable {
	
	mutating func add(_ observer: Observer, handler: @escaping ObservationHandler) {
		observers[observer.id] = handler
	}
	
	mutating func remove(_ observer: Observer) {
		observers.removeValue(forKey: observer.id)
	}
	
	func notify() {
		observers.forEach({ $1() })
	}
	
}
