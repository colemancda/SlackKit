//
// Channel.swift
//
// Copyright © 2015 Peter Zignego. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

public struct Channel {
    
    public let id: String?
    public let created: String?
    public let creator: String?
    internal(set) public var name: String?
    internal(set) public var isArchived: Bool?
    internal(set) public var isGeneral: Bool?
    public let isGroup: Bool?
    public let isDM: Bool?
    internal(set) public var user: String?
    internal(set) public var isUserDeleted: Bool?
    internal(set) public var isOpen: Bool?
    internal(set) public var topic: Topic?
    internal(set) public var purpose: Topic?
    internal(set) public var isMember: Bool?
    internal(set) public var lastRead: String?
    internal(set) public var latest: Message?
    internal(set) public var unread: Int?
    internal(set) public var unreadCountDisplay: Int?
    internal(set) public var hasPins: Bool?
    internal(set) public lazy var members = [String]()
    // Client use
    internal(set) public lazy var pinnedItems = [Item]()
    internal(set) public lazy var usersTyping = [String]()
    internal(set) public lazy var messages = Dictionary<String, Message>()
    
    internal init?(channel:Dictionary<String, AnyObject>?) {
        id = channel?["id"] as? String
        name = channel?["name"] as? String
        created = channel?["created"] as? String
        creator = channel?["creator"] as? String
        isArchived = channel?["is_archived"] as? Bool
        isGeneral = channel?["is_general"] as? Bool
        isGroup = channel?["is_group"] as? Bool
        isDM = channel?["is_im"] as? Bool
        isUserDeleted = channel?["is_user_deleted"] as? Bool
        user = channel?["user"] as? String
        isOpen = channel?["is_open"] as? Bool
        topic = Topic(topic: channel?["topic"] as? Dictionary<String, AnyObject>)
        purpose = Topic(topic: channel?["purpose"] as? Dictionary<String, AnyObject>)
        isMember = channel?["is_member"] as? Bool
        lastRead = channel?["last_read"] as? String
        latest = Message(message: channel?["message"] as? Dictionary<String, AnyObject>)
        unread = channel?["unread_count"] as? Int
        unreadCountDisplay = channel?["unread_count_display"] as? Int
        hasPins = channel?["has_pins"] as? Bool
        
        if let members = channel?["members"] as? [String] {
            self.members = members
        }

    }
    
    internal init?(id:String?) {
        self.id = id
        created = nil
        creator = nil
        isGroup = false
        isDM = false
    }
}
