//
//  Parser.swift
//  TotallyDrug
//
//  Created by Leo Cho on 2023/08/01.
//

import Foundation

/// Class used to process XML files. 
class Parser: NSObject, XMLParserDelegate, ObservableObject {
    
    private var items: [Item] = []
    private var currentItem: Item?
    private var currentElement: String?
    
    // MARK: CDATA
    private var currentDocument: String?
    private var currentArticle: Item.Article?
    private var currentCDATA: String?
    
    /// Parses XML data based on the XMLParserDelegate
    func parse(XML data: Data) -> [Item] {
        let parser = XMLParser(data: data)
        if !items.isEmpty { items.removeAll() }
        parser.delegate = self
        parser.parse()
        return items
    }
    
    /// Converts string to data - cleans up some bad formatting while it does it.
    func stringToData(source text: String) -> Data {
        let trimText = text.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanText = trimText.replacingOccurrences(of: "\n|&nbsp;", with: "", options: .regularExpression)
        return Data(cleanText.utf8)
    }
    
    // MARK: - XMLParserDelegate Functions
    
    internal func parserDidStartDocument(_ parser: XMLParser) {
//        print("Parser: Started parse.")
    }
    
    internal func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
//        print("Parser: Start of element \(elementName)")
        currentElement = elementName
        if elementName == "item" {
            currentItem = Item(id: 0, name: "", engName: "", available: false, OTCAvailable: false, prodType: ProductTypeCategory.empty, imageURL: "", visualDesc: "", useCases: [], dosage: [], warnings: [])
        } else if elementName == "DOC" {
//            print("Parser: Document has the title \(attributeDict["title"] ?? "")")
            currentDocument = attributeDict["title"]
        } else if elementName == "ARTICLE" {
//            print("Parser: Article has the title \(attributeDict["title"] ?? "")")
            currentArticle = Item.Article(articleTitle: attributeDict["title"] ?? "", paragraphs: [])
        }
    }
    
    internal func parser(_ parser: XMLParser, foundCharacters string: String) {
//        print("Parser: Found text \(string)")
        switch currentElement {
        case "ITEM_SEQ":
            currentItem?.id += Int(string) ?? 0
        case "ITEM_NAME":
            currentItem?.name += string
        case "ITEM_ENG_NAME":
            currentItem?.engName += string
        case "CANCEL_NAME":
            currentItem?.available = { string == "정상" ? true : false }()
        case "ETC_OTC_CODE":
            currentItem?.OTCAvailable = { string == "일반의약품" ? true : false }()
//        case "PRODUCT_TYPE":
//            currentItem?.prodType = { ProductTypeCategory.createObject(for: Int(string) ?? 0) }()
//        case "BIG_PRDT_IMG_URL":
//            currentItem?.imageURL += string
        case "CHART":
            currentItem?.visualDesc += string
        default:
            break
        }
    }
    
    internal func parser(_ parser: XMLParser, foundCDATA CDATABlock: Data) {
        if let CDATAString = String(data: CDATABlock, encoding: .utf8) {
//            print("Parser: Found CDATA \(CDATAString)")
            currentCDATA = CDATAString
        }
        
    }
    
    internal func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
//        print("Parser: End of element \(elementName)")
        if elementName == "item" {
            if let item = currentItem {
                items.append(item)
            }
            currentItem = nil
        } else if let cdata = currentCDATA {
            // Very fucked up data.
            let regexData = cdata.replacingOccurrences(of: "<[^>]+>|\n|\t|\r|&nbsp;|○|\\s{2,}", with: "", options: .regularExpression)
            let cleanData = regexData.trimmingCharacters(in: .whitespacesAndNewlines)
            
            switch currentElement {
            case "PARAGRAPH":
                currentArticle?.paragraphs.append(cleanData)
            default:
                break
            }
        } else if elementName == "ARTICLE" {
            let cleanParagraphs = DataSupport.removeEmpty(from: currentArticle?.paragraphs ?? [""])
            currentArticle?.paragraphs = cleanParagraphs
            
            if currentDocument == "효능효과" {
                currentItem?.useCases.append(currentArticle ?? Item.Article(articleTitle: "", paragraphs: []))
            } else if currentDocument == "용법용량" {
                currentItem?.dosage.append(currentArticle ?? Item.Article(articleTitle: "", paragraphs: []))
            } else if currentDocument == "사용상주의사항" {
                currentItem?.warnings.append(currentArticle ?? Item.Article(articleTitle: "", paragraphs: []))
            }
            currentArticle = nil
        } else if elementName == "DOC" {
            currentDocument = nil
        }
        currentElement = nil
        currentCDATA = nil
    }
    
    internal func parserDidEndDocument(_ parser: XMLParser) {
        print("Parser: Successfully completed parse.")
//        print(items)
    }
    
    internal func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        // TODO: Create proper error management. 
        print("Parser: Encountered error \(parseError.localizedDescription)")
    }
    
    // MARK: - Parse Model
    struct Item: Codable {
        var id: Int
        var name: String
        var engName: String
        // TODO: Make the cancel causes into an enum?
        var available: Bool
        var OTCAvailable: Bool
        var prodType: ProductTypeCategory
        
        var imageURL: String
        var visualDesc: String
        
        // MARK: CDATA
        var useCases: [Article]
        var dosage: [Article]
        var warnings: [Article]
        
        // MARK: Internal
        var isFavorite: Bool = false
        
        struct Article: Codable, Hashable {
            var articleTitle: String
            var paragraphs: [String]
        }
    }
}
    
