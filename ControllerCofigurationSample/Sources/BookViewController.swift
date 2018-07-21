// Licensed to the Apache Software Foundation (ASF) under one
// or more contributor license agreements.  See the NOTICE file
// distributed with this work for additional information
//  regarding copyright ownership.  The ASF licenses this file
// to you under the Apache License, Version 2.0 (the
// "License"); you may not use this file except in compliance
// with the License.  You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
//  specific language governing permissions and limitations
// under the License.
//
//  Copyright © 2018 Andrew Biegunow. All rights reserved.
//


import UIKit

class BookViewController: BaseViewController {
  
  private var bookInfo: BookInfo? {
    didSet {
      updateUI()
    }
  }
  
  @IBOutlet weak var titleLabel: UILabel?
  @IBOutlet weak var yearLabel: UILabel?
  @IBOutlet weak var descriptionTextView: UITextView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
  }
  
  @IBAction func close() {
    dismiss(animated: true)
  }
  
  func updateUI() {
    titleLabel?.text = bookInfo?.title
    yearLabel?.text = (bookInfo?.publishYear).map { String($0) }
    descriptionTextView?.text = bookInfo?.description ?? ""
  }
  
}

extension BookViewController: Configurable {
  
  func configure(with bookInfo: BookInfo?) {
    self.bookInfo = bookInfo
  }
  
}

