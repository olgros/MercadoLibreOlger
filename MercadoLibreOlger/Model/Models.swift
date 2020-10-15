///**
/**
MercadoLibreOlger
Created by: Olger Rosero on 14/10/20
Copyright (c)  olger
*/

import Foundation

// MARK: - Products
struct Products: Codable {
    var siteID, query: String?
    var paging: Paging?
    var results: [Result]?

    enum CodingKeys: String, CodingKey {
        case siteID = "site_id"
        case query, paging, results
    }
}

// MARK: - Paging
struct Paging: Codable {
    var total, primaryResults, offset, limit: Int?

    enum CodingKeys: String, CodingKey {
        case total
        case primaryResults = "primary_results"
        case offset, limit
    }
}

// MARK: - Result
struct Result: Codable {
    var id, siteID, title: String?
    var seller: Seller?
    var price: Float?
    //var prices: Prices?
   // var salePrice: JSONNull?
    var currencyID: String?
    var availableQuantity, soldQuantity: Int?
    var buyingMode, listingTypeID, stopTime, condition: String?
    var permalink: String?
    var thumbnail: String?
    var acceptsMercadopago: Bool?
    var installments: Installments?
    var address: Address?
    var shipping: Shipping?
    var sellerAddress: SellerAddress?
    var attributes: [Attribute]?
    var originalPrice: Float?
    var categoryID: String?
   // var officialStoreID: JSONNull?
    var domainID, catalogProductID: String?
    var tags: [String]?
    var catalogListing: Bool?
    var orderBackend: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case siteID = "site_id"
        case title, seller, price//, prices
      //  case salePrice = "sale_price"
        case currencyID = "currency_id"
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case buyingMode = "buying_mode"
        case listingTypeID = "listing_type_id"
        case stopTime = "stop_time"
        case condition, permalink, thumbnail
        case acceptsMercadopago = "accepts_mercadopago"
        case installments, address, shipping
        case sellerAddress = "seller_address"
        case attributes
        case originalPrice = "original_price"
        case categoryID = "category_id"
        //case officialStoreID = "official_store_id"
        case domainID = "domain_id"
        case catalogProductID = "catalog_product_id"
        case tags
        case catalogListing = "catalog_listing"
        case orderBackend = "order_backend" 
    }
}

// MARK: - Address
struct Address: Codable {
    var stateID, stateName, cityID, cityName: String?

    enum CodingKeys: String, CodingKey {
        case stateID = "state_id"
        case stateName = "state_name"
        case cityID = "city_id"
        case cityName = "city_name"
    }
}

// MARK: - Attribute
struct Attribute: Codable {
    var id, name, valueName: String?
    var source: Float?
    var valueID: String?
    var valueStruct: Struct?
    var values: [Value]?
    var attributeGroupID, attributeGroupName: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueName = "value_name"
        case source
        case valueID = "value_id"
        case valueStruct = "value_struct"
        case values
        case attributeGroupID = "attribute_group_id"
        case attributeGroupName = "attribute_group_name"
    }
}

// MARK: - Struct
struct Struct: Codable {
    var number: Float?
    var unit: String?
}

// MARK: - Value
struct Value: Codable {
    var source: Float?
    var id, name: String?
    var valueStruct: Struct?

    enum CodingKeys: String, CodingKey {
        case source, id, name
        case valueStruct = "struct"
    }
}

// MARK: - Installments
struct Installments: Codable {
    var quantity: Int?
    var amount, rate: Double?
    var currencyID: String?

    enum CodingKeys: String, CodingKey {
        case quantity, amount, rate
        case currencyID = "currency_id"
    }
}

// MARK: - Prices
struct Prices: Codable {
}

// MARK: - Seller
struct Seller: Codable {
    var id: Int?
    var permalink: String?
    var registrationDate: String?
    var carDealer, realEstateAgency: Bool?
    var tags: [String]?
   // var eshop: Eshop
    var sellerReputation: SellerReputation?

    enum CodingKeys: String, CodingKey {
        case id, permalink
        case registrationDate = "registration_date"
        case carDealer = "car_dealer"
        case realEstateAgency = "real_estate_agency"
        case tags
      //  case eshop
        case sellerReputation = "seller_reputation"
    }
}

// MARK: - Eshop
struct Eshop: Codable {
    var nickName: String?
   // var eshopRubro: JSONNull?
    var eshopID: Float?
   // var eshopLocations: [JSONAny]?
    var siteID: String?
    var eshopLogoURL: String?
    var eshopStatusID, seller, eshopExperience: Int?

    enum CodingKeys: String, CodingKey {
        case nickName = "nick_name"
       // case eshopRubro = "eshop_rubro"
        case eshopID = "eshop_id"
       // case eshopLocations = "eshop_locations"
        case siteID = "site_id"
        case eshopLogoURL = "eshop_logo_url"
        case eshopStatusID = "eshop_status_id"
        case seller
        case eshopExperience = "eshop_experience"
    }
}

// MARK: - SellerReputation
struct SellerReputation: Codable {
    var transactions: Transactions?
    var powerSellerStatus: String?
    var metrics: Metrics?
    var levelID: String?

    enum CodingKeys: String, CodingKey {
        case transactions
        case powerSellerStatus = "power_seller_status"
        case metrics
        case levelID = "level_id"
    }
}

// MARK: - Metrics
struct Metrics: Codable {
    var claims, delayedHandlingTime: Cancellations?
    var sales: Sales?
    var cancellations: Cancellations?

    enum CodingKeys: String, CodingKey {
        case claims
        case delayedHandlingTime = "delayed_handling_time"
        case sales, cancellations
    }
}

// MARK: - Cancellations
struct Cancellations: Codable {
    var rate: Double?
    var value: Int?
    var period: String?
}

// MARK: - Sales
struct Sales: Codable {
    var period: String?
    var completed: Int?
}

// MARK: - Transactions
struct Transactions: Codable {
    var total, canceled: Int?
    var period: String?
    var ratings: Ratings?
    var completed: Int?
}

// MARK: - Ratings
struct Ratings: Codable {
    var negative, positive, neutral: Double?
}

// MARK: - SellerAddress
struct SellerAddress: Codable {
    var id, comment, addressLine, zipCode: String?
    var country, state, city: City?
    var latitude, longitude: String?

    enum CodingKeys: String, CodingKey {
        case id, comment
        case addressLine = "address_line"
        case zipCode = "zip_code"
        case country, state, city, latitude, longitude
    }
}

// MARK: - City
struct City: Codable {
    var id, name: String?
}

// MARK: - Shipping
struct Shipping: Codable {
    var freeShipping: Bool?
    var mode: String?
    var tags: [String]?
    var logisticType: String?
    var storePickUp: Bool?

    enum CodingKeys: String, CodingKey {
        case freeShipping = "free_shipping"
        case mode, tags
        case logisticType = "logistic_type"
        case storePickUp = "store_pick_up"
    }
}
