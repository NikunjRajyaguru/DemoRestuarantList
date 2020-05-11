/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Restaurants : Codable {
	let id : Int?
	let name : String?
	let address : String?
	let city : String?
	let state : String?
	let area : String?
	let postal_code : String?
	let country : String?
	let phone : String?
	let lat : Double?
	let lng : Double?
	let price : Int?
	let reserve_url : String?
	let mobile_reserve_url : String?
	let image_url : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case address = "address"
		case city = "city"
		case state = "state"
		case area = "area"
		case postal_code = "postal_code"
		case country = "country"
		case phone = "phone"
		case lat = "lat"
		case lng = "lng"
		case price = "price"
		case reserve_url = "reserve_url"
		case mobile_reserve_url = "mobile_reserve_url"
		case image_url = "image_url"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		address = try values.decodeIfPresent(String.self, forKey: .address)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		state = try values.decodeIfPresent(String.self, forKey: .state)
		area = try values.decodeIfPresent(String.self, forKey: .area)
		postal_code = try values.decodeIfPresent(String.self, forKey: .postal_code)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		phone = try values.decodeIfPresent(String.self, forKey: .phone)
		lat = try values.decodeIfPresent(Double.self, forKey: .lat)
		lng = try values.decodeIfPresent(Double.self, forKey: .lng)
		price = try values.decodeIfPresent(Int.self, forKey: .price)
		reserve_url = try values.decodeIfPresent(String.self, forKey: .reserve_url)
		mobile_reserve_url = try values.decodeIfPresent(String.self, forKey: .mobile_reserve_url)
		image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
	}

}