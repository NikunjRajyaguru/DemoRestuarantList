/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct ResListModel : Codable {
	let total_entries : Int?
	let per_page : Int?
	let current_page : Int?
	let restaurants : [Restaurants]?

	enum CodingKeys: String, CodingKey {

		case total_entries = "total_entries"
		case per_page = "per_page"
		case current_page = "current_page"
		case restaurants = "restaurants"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		total_entries = try values.decodeIfPresent(Int.self, forKey: .total_entries)
		per_page = try values.decodeIfPresent(Int.self, forKey: .per_page)
		current_page = try values.decodeIfPresent(Int.self, forKey: .current_page)
		restaurants = try values.decodeIfPresent([Restaurants].self, forKey: .restaurants)
	}
}


//class RestaurantsList: NSObject {
//
//    var id: Int
//    var name: String?
//    var address: String?
//    var phone: String?
//    var address: String?
//    var address: String?
//    var address: String?
//    var address: String?
//
//    init(id: Int, fname: String?, lname : String?){
//        self.id = id
//        self.fname = fname
//        self.lname = lname
//    }
//}

