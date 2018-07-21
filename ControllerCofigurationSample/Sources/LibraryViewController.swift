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

class LibraryViewController: BaseViewController {
  // Some model/presentation data
  let readers = [Person(firstName: "John",
                        lastName: "Smith",
                        status: "Student",
                        identifier: 12334234),
                 Person(firstName: "Alex",
                        lastName: "Green",
                        status: "Teacher",
                        identifier: 252423)]
  
  let books = [BookInfo(title: "The Lord of the Rings",
                        publishYear: 1954,
                        description: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
               BookInfo(title: "The Martian Chronicles",
                        publishYear: 1950,
                        description: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.")]
  
  
  // This is a single place to configure eeach view controller presented by current one.
  // For each segue we define value that should be used to configure that is going to be presented.
  // Instead of writing long "if-let-else" chain in prepare(for: ...) when segue is triggered
  // in map below define Configurator object for each segue ID. Configurator is created with closure
  // that returns object used for passing to configure(_:) method of the corresponding view controller.
  override var segueIDToConfigurator: [String : Configuring] {
    return [
      k.ToBookDetailsSegueID: Configurator<BookViewController> {
        // Will be pased to "BookViewController.configure(_:)"
        return self.books[0]
      },
      k.ToReaderDetailsSegueID: Configurator<ReaderViewController> {
        // Will be pased to "ReaderViewController.configure(_:)"
        return (self.readers[0], self.books[1])
      }

      // The following entry demonstrates that it's not possible to return
      // incorrect data for configuring controller.
      // Comment previuos dictionary entry and uncomment this one to see the compiler error.
//      k.ToReaderDetailsSegueID: Configurator<ReaderViewController> {
//        // Will be pased to "ReaderViewController.configure(_:)"
//        return self.books[0]
//      }

      // The following entry demonstrates program behavior
      // in case improper controller was associated with segue
      // To see the run time error happening in this case comment the dictionary entry
      // for "k.ToReaderDetailsSegueID" key,
      // uncomment this one and trigger segue by tapping "Reader Details" button
//      k.ToReaderDetailsSegueID: Configurator<UnusedViewController> {
//        return "Some value"
//      }
    ]
  }
}

extension LibraryViewController {
  
  enum k {
    static let ToBookDetailsSegueID = "LibraryToBookDetails"
    static let ToReaderDetailsSegueID = "LibraryToReaderDetails"
  }
  
}

