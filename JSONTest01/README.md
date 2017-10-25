JSONTest is single view application designed to parse JSON and display its contents on console output window

It also features the following code that parse JSON from given URL

 /*
         // We can read JSON file directly using URL of asset in internet
         //first there must the URL for id
         let urlBBB = URL(string: "https://jsonip.com")
         
         // Request is launched as a task, which works in a separate thread
         URLSession.shared.dataTask(with: urlBBB!, completionHandler: {
         (dataBBB, response, error) in
         guard let dataBBB = dataBBB, error == nil
         else { return }
         do {
         // Use JSON parser to decode data
         let jsonBBB = try JSONSerialization.jsonObject(with: dataBBB, options: [])
         
         // create a handle to read Any type JSON object
         if let resultBBB = jsonBBB as? [String:Any] {
         if let iterBBB4 = resultBBB["reject-fascism"] as? String {
         NSLog(iterBBB4)
         }
         }
         }
         catch let MyError as NSError
         {
         print(MyError.description)
         }
         }).resume()
 */
