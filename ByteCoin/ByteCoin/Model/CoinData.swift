//
//  CoinData.swift
//  ByteCoin
//
//  Created by Victor Cruz Galindo on 31/05/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

// MARK: - CoinData
struct CoinData: Codable {
  let time, assetIDBase, assetIDQuote: String
  let rate: Double
  let srcSideBase, srcSideQuote: [SrcSide]

  enum CodingKeys: String, CodingKey {
    case time
    case assetIDBase = "asset_id_base"
    case assetIDQuote = "asset_id_quote"
    case rate
    case srcSideBase = "src_side_base"
    case srcSideQuote = "src_side_quote"
  }
}

  // MARK: - SrcSide
struct SrcSide: Codable {
  let time, asset: String
  let rate, volume: Double
}
