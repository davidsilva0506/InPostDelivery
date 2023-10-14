//
//  InPost_Interview_Coding_TaskTests.swift
//  InPost Interview Coding TaskTests
//
//  Created by Damian Piwowarski on 03/11/2022.
//

import XCTest

@testable import InPost_Interview_Coding_Task

class PackListViewModelTests: XCTestCase {
    
    var packs: [Pack]?

    override func setUp() {

        super.setUp()
        
        if let packs: [Pack] = try? self.load(from: "packs") {

            self.packs = packs
        }
    }
    
    override func tearDown() {

        super.tearDown()
    }
    
    func testPacksArchived() async throws {
        
        let expectedOriginalCount = 6
        let expectedCountAfterAddingPacks = 8
        let expectedFinalCount = 7

        var packs = try XCTUnwrap(self.packs)
        
        XCTAssertEqual(packs.count, expectedOriginalCount)

        let unarchivedPack = Pack(id: "id",
                                status: .other,
                                sender: "sender",
                                expiryDate: nil,
                                pickUpDate: nil,
                                storedDate: nil,
                                shipmentType: .locker)

        let archivedPack = Pack(id: "id",
                                status: .other,
                                sender: "sender",
                                expiryDate: nil,
                                pickUpDate: nil,
                                storedDate: nil,
                                shipmentType: .locker,
                                isArchived: true)
        
        packs.append(unarchivedPack)
        packs.append(archivedPack)
        
        let validPacks = PackListViewModel.removeArchivedPacks(packs)

        XCTAssertEqual(packs.count, expectedCountAfterAddingPacks)
        XCTAssertEqual(packs.count, expectedFinalCount)
    }
    
    func testGroupByDay() async throws {
        

    }
}
