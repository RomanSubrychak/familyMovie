//
//  NSManagedObjectContext+Persist.swift
//  FamilyMovies
//
//  Created by Roman Subrichak on 8/11/17.
//  Copyright © 2017 DonnyWals. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
	func persist(block: @escaping () -> Void) {
		perform {
			block()
			
			do {
				try self.save()
			} catch {
				self.rollback()
			}
		}
	}
}
