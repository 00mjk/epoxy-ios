//  Created by Laura Skelton on 5/11/17.
//  Copyright © 2017 Airbnb. All rights reserved.

import Foundation

/// The `EpoxySection` contains the section data for a type of list, such as a TableView.
public struct EpoxySection {

  // MARK: Lifecycle

  public init(
    dataID: String,
    sectionHeader: EpoxyableModel?,
    items: [EpoxyableModel])
  {
    self.dataID = dataID
    self.sectionHeader = sectionHeader
    self.items = items
  }

  public init(
    sectionHeader: EpoxyableModel?,
    items: [EpoxyableModel])
  {
    self.init(
      dataID: "",
      sectionHeader: sectionHeader,
      items: items)
  }

  public init(items: [EpoxyableModel]) {
    self.init(
      dataID: "",
      sectionHeader: nil,
      items: items)
  }

  // MARK: Public

  /// The reference id for the model backing this section.
  public let dataID: String

  /// The data for the section header to be displayed in this section.
  public let sectionHeader: EpoxyableModel?

  /// The data for the items to be displayed in this section.
  public let items: [EpoxyableModel]
}

// MARK: Diffable

extension EpoxySection: Diffable {
  public func isDiffableItemEqual(to otherDiffableItem: Diffable) -> Bool {
    guard let otherDiffableSection = otherDiffableItem as? EpoxySection else { return false }
    return dataID == otherDiffableSection.dataID
  }

  public var diffIdentifier: String? {
    return dataID
  }
}