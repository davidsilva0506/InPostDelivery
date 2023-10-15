//
//  InPost_Interview_Coding_TaskTests.swift
//  InPost Interview Coding TaskTests
//
//  Created by Damian Piwowarski on 03/11/2022.
//

import XCTest

@testable import InPost_Interview_Coding_Task

class PackListViewModelTests: XCTestCase {
    
    private enum Constants {
        
        static let unarchivedPack = Pack(id: "id",
                                         status: .other,
                                         sender: "sender",
                                         expiryDate: nil,
                                         pickUpDate: nil,
                                         storedDate: nil,
                                         shipmentType: .locker)

        static let archivedPack = Pack(id: "id",
                                       status: .other,
                                       sender: "sender",
                                       expiryDate: nil,
                                       pickUpDate: nil,
                                       storedDate: nil,
                                       shipmentType: .locker,
                                       isArchived: true)
    }
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
    
    func testLoadPacks() throws {
        
        self.packs = try? self.load(from: "packs")
        
        XCTAssertNotNil(self.packs)
    }
    
    func testArchivedPacks() throws {
        
        let expectedOriginalCount = 7

        var packs = try XCTUnwrap(self.packs)
        
        XCTAssertEqual(packs.count, expectedOriginalCount)
        
        packs.append(Constants.unarchivedPack)
        packs.append(Constants.archivedPack)
        
        let validPacks = PackListViewModel.removeArchivedPacks(packs)

        XCTAssertEqual(packs.count, expectedOriginalCount + 2)
        XCTAssertEqual(validPacks.count, expectedOriginalCount + 1)
    }
    
    func testGroupedPacks() throws {
        
        let expectedTotalCount = 7 //unsupported status should be removed when grouping
        let expectedReadyCount = 3
        let expectedOtherCount = 3
        
        let packs = try XCTUnwrap(self.packs)
        let groupedPacks = PackListViewModel.groupPacks(packs)
        
        let readyPacks = groupedPacks[safe: 0]
        let otherPacks = groupedPacks[safe: 1]
        
        XCTAssertNotNil(readyPacks)
        XCTAssertNotNil(otherPacks)
        XCTAssertEqual(packs.count, expectedTotalCount)
        XCTAssertEqual(readyPacks?.count, expectedReadyCount)
        XCTAssertEqual(otherPacks?.count, expectedOtherCount)
    }
    
    func testOrderedPacks() throws {
        
        let packs = try XCTUnwrap(self.packs)
        let orderedPacks = PackListViewModel.orderPacks(packs)

        XCTAssertEqual(orderedPacks.count, 7)
        XCTAssertEqual(orderedPacks.first?.id, "96730345345597442248333")
        XCTAssertEqual(orderedPacks[safe: 1]?.id, "26730345345597442248333")
        XCTAssertEqual(orderedPacks[safe: 2]?.id, "46730345345597442248333")
        XCTAssertEqual(orderedPacks[safe: 3]?.id, "56730345345597442248333")
        XCTAssertEqual(orderedPacks[safe: 4]?.id, "16730345345597442248333")
        XCTAssertEqual(orderedPacks[safe: 5]?.id, "66730345345597442248333")
        XCTAssertEqual(orderedPacks.last?.id, "76730345345597442248333")
    }
    
    func testValidResults() throws {
        
        let expectedOriginalCount = 7
        let expectedReadyCount = 3
        let expectedOtherCount = 3

        var packs = try XCTUnwrap(self.packs)
        
        XCTAssertEqual(packs.count, expectedOriginalCount)
        
        packs.append(Constants.archivedPack)
        
        XCTAssertEqual(packs.count, expectedOriginalCount + 1)
        
        let validPacks = PackListViewModel.removeArchivedPacks(packs)
        let validOrderedPacks = PackListViewModel.orderPacks(validPacks)
        
        XCTAssertEqual(validOrderedPacks.count, expectedOriginalCount)
        XCTAssertEqual(validOrderedPacks.first?.id, "96730345345597442248333")
        XCTAssertEqual(validOrderedPacks[safe: 1]?.id, "26730345345597442248333")
        XCTAssertEqual(validOrderedPacks[safe: 2]?.id, "46730345345597442248333")
        XCTAssertEqual(validOrderedPacks[safe: 3]?.id, "56730345345597442248333")
        XCTAssertEqual(validOrderedPacks[safe: 4]?.id, "16730345345597442248333")
        XCTAssertEqual(validOrderedPacks[safe: 5]?.id, "66730345345597442248333")
        XCTAssertEqual(validOrderedPacks.last?.id, "76730345345597442248333")
        
        let validResults = PackListViewModel.groupPacks(validOrderedPacks)
        
        let readyPacks = validResults[safe: 0]
        let otherPacks = validResults[safe: 1]
        
        XCTAssertNotNil(readyPacks)
        XCTAssertNotNil(otherPacks)
        XCTAssertEqual(readyPacks?.count, expectedReadyCount)
        XCTAssertEqual(otherPacks?.count, expectedOtherCount)
        
        //check if order is respected after grouping
        XCTAssertEqual(readyPacks?.first?.id, "46730345345597442248333")
        XCTAssertEqual(readyPacks?[safe: 1]?.id, "56730345345597442248333")
        XCTAssertEqual(readyPacks?.last?.id, "16730345345597442248333")
        
        XCTAssertEqual(otherPacks?.first?.id, "96730345345597442248333")
        XCTAssertEqual(otherPacks?[safe: 1]?.id, "26730345345597442248333")
        XCTAssertEqual(otherPacks?.last?.id, "66730345345597442248333")
    }
}
