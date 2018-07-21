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

class ReaderViewController: BaseViewController {
  
  private var readerInfo: Person? {
    didSet {
      updateUI()
    }
  }
  
  private var currentBook: BookInfo? {
    didSet {
      updateUI()
    }
  }
  
  @IBOutlet weak var firstNameLablel: UILabel?
  @IBOutlet weak var lastNameLabel: UILabel?
  @IBOutlet weak var statusLabel: UILabel?
  @IBOutlet weak var identifierLabel: UILabel?
  @IBOutlet weak var bookTitleLabel: UILabel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
  }
  
  @IBAction func close() {
    dismiss(animated: true)
  }
  
  func updateUI() {
    firstNameLablel?.text = readerInfo?.firstName
    lastNameLabel?.text = readerInfo?.lastName
    statusLabel?.text = readerInfo?.status
    identifierLabel?.text = (readerInfo?.identifier).map { String($0) }
    let year = (currentBook?.publishYear).map { String($0) } ?? "Unknown"
    bookTitleLabel?.text = (currentBook?.title ?? "Unknown Title") + " (\(year))"
  }
  
}

extension ReaderViewController: Configurable {
  
  typealias ConfigurationType = (reader: Person, book: BookInfo?)
  
  func configure(with configuration: ConfigurationType) {
    self.readerInfo = configuration.reader
    self.currentBook = configuration.book
  }
  
}
