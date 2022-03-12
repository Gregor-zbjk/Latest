//
//  MacAppStoreAppUpdate.swift
//  Latest
//
//  Created by Max Langer on 07.04.17.
//  Copyright © 2017 Max Langer. All rights reserved.
//

import Cocoa

/**
 Mac App Store app bundle subclass, it handles the parsing of the iTunes JSON
 */
class MacAppStoreAppBundle: AppBundle {

    /// The url of the app in the Mac App Store
    var appStoreURL : URL?
	
	/// The icon representing the source of the app.
	override class var sourceIcon: NSImage? {
		return NSImage(named: "appstore")!
	}
	
	/// The name of the app's source.
	override class var sourceName: String? {
		return NSLocalizedString("Mac App Store", comment: "The source name of apps loaded from the App Store.")
	}
	
	
	// MARK: - Actions
	
	override func update() {
		// This is a temporary workaround to disable direct updates of Mac App Store apps, which does not work anymore.
		NSWorkspace.shared.open(self.appStoreURL ?? self.url)
	}
	
}
