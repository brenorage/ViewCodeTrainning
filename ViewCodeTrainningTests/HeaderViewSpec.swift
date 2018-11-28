//
//  HeaderViewSpec.swift
//  ViewCodeTrainningTests
//
//  Created by Breno Rage Aboud on 28/11/2018.
//  Copyright © 2018 thiago.lioy. All rights reserved.
//

import Foundation
import Quick
import Nimble

import Nimble_Snapshots
import UIKit

@testable import ViewCodeTrainning

class HeaderViewSpec: QuickSpec {
    override func spec() {
        describe("it's a HeaderView") {
            context("UI") {
                it("should look exactly like the snapshot") {
                    let frame = CGRect(x: 0, y: 0, width: 320, height: 70)
                    let headerView = HeaderView(frame: frame)
                    expect(headerView) == snapshot("HeaderView")
                }
            }
        }
    }
}

