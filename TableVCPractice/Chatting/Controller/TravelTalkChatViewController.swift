//
//  TravelTalkChatViewController.swift
//  TableVCPractice
//
//  Created by JinwooLee on 1/12/24.
//

import UIKit

class TravelTalkChatViewController: UIViewController {

    @IBOutlet var chatTableView: UITableView!
    @IBOutlet var searchTextView: UITextView!
    
    var storedData : ChatRoom?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureDesign()
        configureUIView()
        updateMessage()
    }

}

extension TravelTalkChatViewController : setUIView {
    static var identifier: String = "TravelTalkChat"
    static var storyboard: String = "TravelTalkChat"
    
    func configureUIView() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        // sender
        let xib1 = UINib(nibName: TravelChatSenderTableViewCell.identifier, bundle: nil)
        chatTableView.register(xib1, forCellReuseIdentifier: TravelChatSenderTableViewCell.identifier)
        
        // receiver
        let xib2 = UINib(nibName: TravelChatReceiverTableViewCell.identifier, bundle: nil)
        chatTableView.register(xib2, forCellReuseIdentifier: TravelChatReceiverTableViewCell.identifier)
        
    }
    
    func configureDesign() {
        
        if let item = storedData {
            navigationItem.title = item.chatroomName
            navigationController?.navigationBar.tintColor = .black
            navigationController?.navigationBar.topItem?.title = " "
        }
        
        // https://yeonduing.tistory.com/37
        // label과 table cell의 크기를 동적으로 변경하기 위해선...이게 핵심이었다...... ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ
        chatTableView.estimatedRowHeight = 30
        chatTableView.rowHeight = UITableView.automaticDimension
        chatTableView.separatorStyle = .none
        
        // textView
        searchTextView.text = "메세지를 입력하세요"
        searchTextView.textColor = .lightGray
        searchTextView.layer.borderWidth = 1
        searchTextView.layer.borderColor = UIColor.lightGray.cgColor
        searchTextView.layer.cornerRadius = 10
        searchTextView.centerVertically()
        
    }
}

extension TravelTalkChatViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let item = storedData {
            return item.chatList.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let senderCell = tableView.dequeueReusableCell(withIdentifier: TravelChatSenderTableViewCell.identifier, for: indexPath) as! TravelChatSenderTableViewCell
        
        let recieverCell = tableView.dequeueReusableCell(withIdentifier: TravelChatReceiverTableViewCell.identifier, for: indexPath) as! TravelChatReceiverTableViewCell
        
        senderCell.selectionStyle = .none
        recieverCell.selectionStyle = .none
                
        if let item = storedData {
            if item.chatList[indexPath.row].user.profileImage != "user"{
                senderCell.setDesignTableCell(cell: item.chatList[indexPath.row])
                
                return senderCell
            } else {
                recieverCell.setDesignTableCell(cell: item.chatList[indexPath.row])
                
                return recieverCell
            }
        } else {
            return UITableViewCell() // 
        }
    }
}

extension TravelTalkChatViewController {
    //채팅 스크롤 아래로
    func scrollLastOfTableView() {
        // First figure out how many sections there are
        let lastSectionIndex = chatTableView.numberOfSections - 1

        // Then grab the number of rows in the last section
        let lastRowInLastSection = chatTableView.numberOfRows(inSection: lastSectionIndex) - 1

        let indexPath = IndexPath(row: lastRowInLastSection, section: lastSectionIndex)

        chatTableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
    
    func updateMessage() {
        chatTableView.reloadData()
        scrollLastOfTableView()
    }
}

extension TravelTalkChatViewController : UITextViewDelegate {
    // 메세지가 시작될 때, 텍스트 날림
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == searchTextView.text {
            textView.text = nil
            textView.textColor = .black
        }
    }
    // 끝나면
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "메세지를 입력하세요"
            textView.textColor = UIColor.lightGray
        }
    }
}
