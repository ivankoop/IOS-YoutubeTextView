//
//  YouTubeTextView.swift
//  youtubeiframe
//
//  Created by ivan koop on 8/9/17.
//  Copyright © 2017 Ivan Koop. All rights reserved.
//

import UIKit

class YouTubeTextView: UITextView {

    
    private var formated_string : String!;
    private var encoded_text : Data!;
    private var attributed_text : NSAttributedString!;
    
    public func setText(text: String) {
        
        self.formated_string = formatString(text: text);
        
        self.encoded_text = self.formated_string.data(using: String.Encoding.utf8);
        
        if let attributedBody = try? NSAttributedString(data: encoded_text,
                                                        options: [NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType],
                                                        documentAttributes: nil) {
            
            self.attributed_text = attributedBody;
        } else {
            self.text = "";
        }
        
        if let attributed_text = self.attributed_text {
            self.attributedText = attributed_text;
        } else {
            print("error");
        }
        
    }
    
    
    
    //main function that adds the youtube frame
    func formatString(text: String) -> String {
        
        let iframe_texts = matches(for: ".*iframe.*", in: text);
        var new_text = text;
        
        if iframe_texts.count > 0 {
            
            for iframe_text in iframe_texts {
                let iframe_id = matches(for: "((?<=(v|V)/)|(?<=be/)|(?<=(\\?|\\&)v=)|(?<=embed/))([\\w-]++)", in: iframe_text);
                
                if iframe_id.count > 0 { //just in case there is another type of iframe
                    
                    new_text = new_text.replacingOccurrences(of: iframe_text, with:"<a href='https://www.youtube.com/watch?v=\(iframe_id[0])'><img src=\"https://img.youtube.com/vi/" + iframe_id[0] + "/0.jpg\" alt=\"\" width=\"600\" /></a><p style='text-align: right'>YouTube.com</p>");
                    
                }
                
                
                
            }
            
        } else {
            print("there is no iframe in this text");
        }
        
        return new_text;
    }
    
    func matches(for regex: String, in text: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex,  options: .caseInsensitive)
            let nsString = text as NSString
            let results = regex.matches(in: text, range: NSRange(location: 0, length: nsString.length))
            return results.map { nsString.substring(with: $0.range)}
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }

}
