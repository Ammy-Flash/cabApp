//
//  String+Extension.swift
//  DoTryCatch
//
//  Created by Sean Allen on 8/30/17.
//  Copyright © 2017 Sean Allen. All rights reserved.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
    var isValidPincode: Bool {
        let pincodeFormat = "^[0-9]{6}$"
        let pincodePredicate = NSPredicate(format:"SELF MATCHES %@", pincodeFormat)
        return pincodePredicate.evaluate(with: self)
    }
    var isValidCity : Bool {
        let cityArray = ["Agartala",
                         "Agra",
                         "Agumbe",
                         "Ahmedabad",
                         "Aizawl",
                         "Ajmer",
                         "Alappuzha Beach",
                         "Allahabad",
                         "Alleppey",
                         "Almora",
                         "Amarnath",
                         "Amritsar",
                         "Anantagir",
                         "Andaman and Nicobar Islands",
                         "Araku valley",
                         "Aurangabad",
                         "Ayodhya",
                         "Badrinath",
                         "Bangalore",
                         "Baroda",
                         "Bastar",
                         "Bhagalpur",
                         "Bhilai",
                         "Bhimtal",
                         "Bhopal",
                         "Bhubaneswar",
                         "Bhuj",
                         "Bidar",
                         "Bilaspur",
                         "Bodh Gaya",
                         "Calicut",
                         "Chail",
                         "Chamba",
                         "Chandigarh",
                         "Chennai",
                         "Chennai Beaches",
                         "Cherai",
                         "Cherrapunji",
                         "Chidambaram",
                         "Chikhaldara Hills",
                         "Chopta",
                         "Coimbatore",
                         "Coonoor",
                         "Coorg",
                         "Corbett National Park",
                         "Cotigao Wild Life Sanctuary",
                         "Cuttack",
                         "Dadra and Nagar Haveli",
                         "Dalhousie",
                         "Daman and Diu",
                         "Darjeeling",
                         "Dehradun",
                         "Delhi",
                         "Devikulam",
                         "Dhanaulti",
                         "Dharamashala",
                         "Dindigul",
                         "Dudhwa National Park",
                         "Dwaraka",
                         "Faridabad",
                         "Gandhinagar",
                         "Gangotri",
                         "Gangtok",
                         "Gir Wildlife Sanctuary",
                         "Goa",
                         "Great Himalayan National Park",
                         "Gulmarg",
                         "Gurgaon",
                         "Guruvayoor",
                         "Guwahati",
                         "Gwalior",
                         "Hampi",
                         "Haridwar",
                         "Hogenakkal",
                         "Horsley Hills",
                         "Hyderabad",
                         "Idukki",
                         "Imphal",
                         "Indore",
                         "Itangar",
                         "Jabalpur",
                         "Jaipur",
                         "Jaisalmer",
                         "Jalandhar",
                         "Jammu",
                         "Jamshedpur",
                         "Jodhpur",
                         "Kanchipuram",
                         "Kanha National Park",
                         "Kanpur",
                         "Kanyakumari",
                         "Kargil",
                         "Karwar",
                         "Kausani",
                         "Kedarnath",
                         "Keoladeoghana National Park",
                         "Khajuraho",
                         "Kochi",
                         "Kodaikanal",
                         "Kolkata",
                         "Kollam",
                         "Konark",
                         "Kotagiri",
                         "Kottakkal and Ayurveda",
                         "Kovalam",
                         "Kovalam and Ayurveda",
                         "Kudremukh",
                         "Kullu",
                         "Kumaon",
                         "Kumarakom",
                         "Kumarakom and Ayurveda",
                         "Kumarakom Bird Sanctuary",
                         "Kurukshetra",
                         "Lakshadweep",
                         "Lucknow",
                         "Ludhiana",
                         "Madurai",
                         "Mahabalipuram",
                         "Malpe Beach",
                         "Manas National Park",
                         "Mangalore",
                         "Maravanthe Beach",
                         "Margoa",
                         "Mount Abu",
                         "Mumbai",
                         "Munnar",
                         "Mussoorie",
                         "Mysore",
                         "Nahsik",
                         "Nalanda",
                         "Nanda Devi National Park",
                         "Nandi Hills",
                         "Netravali Wild Life Sanctuary",
                         "Ooty",
                         "Orchha",
                         "Pahalgam",
                         "Palakkad",
                         "Panchgani",
                         "Patna",
                         "Patnitop",
                         "Pattadakkal",
                         "Periyar Wildlife Sanctuary",
                         "Pithoragarh",
                         "Pondicherry",
                         "Pune",
                         "Puri",
                         "Pushkar",
                         "Raipur",
                         "Rajaji National Park",
                         "Rajgir",
                         "Rameshwaram",
                         "Ranchi",
                         "Ranganthittu Bird Sanctuary",
                         "Ranikhet",
                         "Ranthambore",
                         "Rishikesh",
                         "Rourkela",
                         "Sanchi",
                         "Saputara",
                         "Sariska Wildlife Sanctuary",
                         "Shillong",
                         "Shimla",
                         "Sohna_Hills",
                         "Srinagar",
                         "Sunderbans",
                         "Surat",
                         "Tezpur",
                         "Thanjavur",
                         "Thiruvananthapuram",
                         "Thrissur",
                         "Tirunelveli",
                         "Tirupati",
                         "Trichy",
                         "Udaipur",
                         "Ujjain",
                         "Vaishali",
                         "Valley of Flowers",
                         "Varanasi",
                         "Varkala and Ayurveda",
                         "Vijayawada",
                         "Vishakhapatnam",
                         "Vrindhavan",
                         "Warangal",
                         "Wayanad",
                         "Wayanad Wildlife Sanctuary",
                         "Yercaud",
                         "Zanskar"]
        if(cityArray.filter { $0.localizedCaseInsensitiveContains(self) }.count > 0){
            return true
        }else{
            return false
        }
         
    }
    var isValidState : Bool {
        let stateArray = [  "Andaman and Nicobar Islands",
                            "Andhra Pradesh",
                            "Arunachal Pradesh",
                            "Assam",
                            "Bihar",
                            "Chandigarh",
                            "Chhattisgarh",
                            "Dadra and Nagar Haveli",
                            "Daman and Diu",
                            "Delhi",
                            "Goa",
                            "Gujarat",
                            "Haryana",
                            "Himachal Pradesh",
                            "Jammu and Kashmir",
                            "Jharkhand",
                            "Karnataka",
                            "Kerala",
                            "Lakshadweep",
                            "Madhya Pradesh",
                            "Maharashtra",
                            "Manipur",
                            "Meghalaya",
                            "Mizoram",
                            "Nagaland",
                            "Orissa",
                            "Pondicherry",
                            "Punjab",
                            "Rajasthan",
                            "Sikkim",
                            "Tamil Nadu",
                            "Telangana",
                            "Tripura",
                            "Uttaranchal",
                            "Uttar Pradesh",
                            "West Bengal"]
        if(stateArray.filter { $0.localizedCaseInsensitiveContains(self) }.count > 0){
            return true
        }else{
            return false
        }
        
    }
}