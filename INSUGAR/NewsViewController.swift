//
//  NewsViewController.swift
//  INSUGAR
//
//  Created by Kawewut Chujit on 3/22/2560 BE.
//  Copyright © 2560 kritsada sangmoon. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    var news = ["\tกรมควบคุมโรค แนะผู้ป่วยเบาหวาน ควรหันมาให้ความสำคัญกับอาหารประเภทปลา ซึ่งมีคุณค่าทางอาหารมาก ซึ่งทั้งในปลาน้ำจืดและปลาทะเล\n\t ปลาเป็นหนึ่งในอาหารที่มีโคเรสโตรอลต่ำ ย่อยง่าย และเนื้อปลาเป็นโปรตีนคุณภาพดีที่มีประโยชน์ต่อร่างกายและสมอง นอกจากเนื้อปลาแล้ว ไขมันปลาก็ยังมีประโยชน์ เป็นแหล่ง โอเมก้า – 3 ที่หลายคนคิดว่ามีแต่ในปลาทะเลเท่านั้น แต่จริงๆ แล้วมีอยู่ทั้งในปลาน้ำจืดและปลาทะเล โดยโอเมก้า – 3 จะช่วยลดความเสี่ยงในการเกิดโรคหลอดเลือดหัวใจอุดตัน ที่เป็นสาเหตุของโรคเบาหวาน\n\t สำหรับการเลือกบริโภคปลาจะต่างจากการเลือกเนื้อสัตว์อื่นๆ โดยการเลือกซื้อเนื้อหมูหรือเนื้อสัตว์อื่นๆ เราจะเลือกที่มีมันน้อยๆ แต่ถ้าเราเลือกปลาเราต้องเลือกที่ตัวใหญ่ๆ มีไขมันมาก เพราะไขมันเหล่านั้นมีประโยชน์ต่อร่างกายทั้งสิ้น ส่วนชนิดของปลาที่ให้ประโยชน์มากที่สุดคือ ปลาสวาย มีโอเมก้า 3 สูงถึง 2,570 มก. ต่อน้ำหนัก 100 กรัม ซึ่งมากกว่าปลาทะเล จึงอยากแนะนำให้หันมาบริโภคปลาน้ำจืดในบ้านเรา เพราะมีราคาถูกแต่มีคุณประโยชน์ที่สูง แถมช่วยลดการบริโภคปลานำเข้า ที่คุณค่าทางอาหารจะลดลงไปเมื่อถูกแช่แข็ง และที่สำคัญยังไม่พบการแพ้ปลาน้ำจืด เหมือนกับปลาทะเลอีกด้วย ส่วนการปรุงเมนูปลาที่มีคุณประโยชน์ที่สุดอยู่ที่การต้มหรือนึ่ง ที่จะทำให้ได้คุณค่าทางอาหารอย่างครบถ้วนที่สุด โดยให้หลีกเลี่ยงเมนูทอดให้มากที่สุด ทั้งนี้ควรมีการบริโภคอาหารที่มีเมนูปลาอย่างน้อย 2 มื้อต่อสัปดาห์ แต่หากบริโภคได้ทุกวันก็จะดีที่สุด\n\t ที่มา สำนักงานกองทุนสนับสนุนการสร้างเสริมสุขภาพ (สสส.)","\tแนวทางดูแลรักษาผู้ป่วยโรคเบาหวานที่ขา\nเท้า โดยมีข้อปฏิบัติแนะนำดังนี้\n1. ล้างเท้าด้วยสบู่ ถูสูะอาด เช็ดเบาๆ ด้วยผ้าแห้ง\n2. หมั่นตรวจเท้าทุกวัน หากซีดคล้ำ หรือมีตาปลา ตุ่ม พุพอง ควรรีบไปพบแพทย์\n3. ป้องกันผิวแห้ง ผิวแตก ด้วยโลชั่น เพื่อป้องกันผิวแตกโรคแทรกซ้อน/n4. ถุงน่องหรือถุงรองเท้าไม่รัดแน่น แนะนำถุงที่เป็นใยฝ้าย\n5. เลือกรองเท้ามาใส่ให้พอเหมาะ ไม่บีบแน่นเกิน\n6. เลี่ยงการแช่เท้าหรือขาในน้ำนานๆ เพราะจะทำให้ผิวหนังเปื่อย\n7. เมื่อเท้ามีบาดแผล รีบล้างแผล หากเกิดการอักเสบนานให้รีบปรึกษาแพทย์\n8. หมั่นตัดเล็บสม่ำเสมอ ไม่ให้เล็บเบียดกับเนื้อ เพราะจะเกิดแผลง่าย\n9. หมั่นบริหารเท้า ให้เลือดไหลเวียน\n10. ควรงดสูบบุหรี่\n\tที่มา สำนักงานกองทุนสนับสนุนการสร้างเสริมสุขภาพ (สสส.)","\tโรคเบาหวานก่อให้เกิดความผิดปกติของหลอดเลือดทั่วร่างกาย ซึ่งมักนำไปสู่ภาวะแทรกซ้อนในอวัยวะต่างๆ ไม่ว่าจะเป็นความผิดปกติที่สมอง หัวใจ ไต อาการเส้นประสาทชาตามปลายมือและเท้า ตลอดจนการสูญเสียทางการมองเห็นอย่างเฉียบพลันอันเป็นผลจากภาวะเบาหวานขึ้นจอประสาทตา หรือที่มักเรียกกัน ว่า เบาหวานขึ้นตา\n\tรองศาสตราจารย์ นายแพทย์ภฤศ หาญอุตสาหะ ประธานชมรมจอประสาทตาแห่งประเทศไทย ให้ข้อมูลว่า โรคเบาหวานขึ้นจอประสาทตาเริ่มจากหลอดเลือดในจอตาเกิดความผิดปกติ โดยระยะแรกหลอดเลือดฝอยที่จอประสาทตามีอาการโป่งพองและแตกเป็นจุดเลือดออกเล็กๆ หากปล่อยทิ้งไว้จนเกิดการรั่วซึมมากขึ้น จะทำให้ตามัวลงเนื่องจากจุดภาพชัดบวม ต่อมาเมื่อโรคลุกลามมากขึ้นจนเกิดการอุดตันของหลอดเลือด จะทำให้เกิดภาวะจอตาขาดเลือดและกระตุ้นให้เกิดการสร้างหลอดเลือดใหม่ตามกลไกทางธรรมชาติ ซึ่งมักก่อให้เกิดเนื้อเยื่อเป็นพังผืดยึดดึงจอตาจนฉีกขาด ส่งผลให้ผู้ป่วยสูญเสียการมองเห็นอย่างถาวรในที่สุด ทั้งนี้ภาวะเบาหวานขึ้นจอประสาทตาอาจเกิดขึ้นกับดวงตาเพียงข้างเดียว หรือดวงตาทั้งสองข้างในเวลาเดียวกัน\n\tผู้ป่วยเป็นโรคเบาหวานนาน 15 ปีขึ้นไป มีโอกาสเกิดโรคเบาหวานขึ้นจอประสาทตามากถึงร้อยละ 80 โดยสัดส่วนดังกล่าวจะเพิ่มมากขึ้นตามระยะเวลาการป่วยเป็นโรคเบาหวาน ยิ่งไปกว่านั้น คนไทยเกือบร้อยละ 50 ยังไม่ทราบว่าตนเองป่วยเป็นโรคเบาหวาน และยังมีอีกจำนวนมากที่รู้ตัวแต่กลับไม่เข้ารับการรักษา หรือละเลยการควบคุมระดับน้ำตาลในเลือดให้ดี หากผู้ป่วยโรคเบาหวานไม่ได้รับการตรวจตาและเข้ารับการรักษาอย่างทันท่วงที ผู้ป่วยจะมีความเสี่ยงอาการแทรกซ้อนทางจอตา โดย 1 ใน 5 มักสูญเสียการมองเห็นอย่างรวดเร็วภายใน 3 ปี รองศาสตราจารย์ นายแพทย์ภฤศ กล่าวเสริม\n\tการรักษาโรคเบาหวานขึ้นจอประสาทตาทำได้ด้วยการยิงเลเซอร์และการฉีดยาเข้าวุ้นตาเป็นวิธีมาตรฐานสำหรับผู้ป่วยในระยะที่มีการสร้างหลอดเลือดใหม่หรือมีจุดภาพชัดบวม โดยวิธีการดังกล่าวจะช่วยลดการรั่วไหลของเลือดและทำให้หลอดเลือดเกิดใหม่ฝ่อลง แต่สำหรับผู้ป่วยที่มีอาการรุนแรง เช่น ภาวะเลือดออกในวุ้นตา หรือจอประสาทตาหลุดลอกจากการถูกพังผืดดึงรั้งนั้น จำเป็นต้องเข้ารับการผ่าตัดวุ้นตาประกอบวิธีการรักษาอื่นๆ เพื่อป้องกันไม่ให้โรคลุกลามและช่วยซ่อมแซมจอตาให้กลับเข้าที่เดิม อย่างไรก็ตาม การมองเห็นของผู้ป่วยอาจไม่สามารถกลับมาดีดังเดิม เนื่องจากวิธีการต่างๆ มักเป็นการรักษาเมื่อปลายเหตุเพื่อไม่ให้อาการแย่ลง หรือช่วยให้ผู้ป่วยบางรายกลับมามองเห็นในระดับที่ยังสามารถดำเนินชีวิตประจำวันได้ตามปกติ\n\tผู้ป่วยเป็นโรคเบาหวานขึ้นจอประสาทตาระยะแรกอาจไม่รู้สึกว่ามีอาการผิดปกติใดๆ ดังนั้น ผู้ป่วยโรคเบาหวานทุกคนควรเข้ารับการตรวจตาอย่างสม่ำเสมอแม้ไม่มีอาการตามัว โดยจักษุแพทย์จะหยอดยาขยายรูม่านตาและถ่ายภาพจอประสาทตาเพื่อวินิจฉัยจอตาอย่างละเอียด รองศาสตราจารย์ นายแพทย์ภฤศ กล่าว นอกจากนี้ ภาวะจุดภาพชัดบวมอาจเกิดกับดวงตาเพียงข้างเดียว จึงทำให้ผู้ป่วยบางรายไม่รู้ตัวว่าการมองเห็นในตาข้างใดข้างหนึ่งของตนบกพร่อง ฉะนั้น ผู้ป่วยโรคเบาหวานควรหมั่นทดสอบการมองเห็นของตาทีละข้างเป็นประจำด้วยตนเอง โดยปิดตาข้างใดข้างหนึ่งแล้วใช้ตาข้างเดียวมอง หากพบว่าตามัวลงควรรีบพบแพทย์ทันที\n\tสำหรับผู้ป่วยโรคเบาหวานที่มีอาการสายตาพร่ามัวหรือมีปัญหาทางด้านการมองเห็น ควรรีบเข้ารับการวินิจฉัยอาการและขอคำปรึกษาจากจักษุแพทย์ที่มีความเชี่ยวชาญเฉพาะด้าน และหากพบว่ามีอาการของโรคเบาหวานขึ้นจอประสาทตา ควรควบคุมระดับน้ำตาลและความดันโลหิต โดยปรับเปลี่ยนพฤติกรรมตนเองในหลายๆ ด้านเพื่อชะลอการทรุดตัวของโรค และเพิ่มโอกาสตอบสนองต่อการรักษา นอกจากการเลือกรับประทานอาหารที่เหมาะสม โดยหลีกเลี่ยงอาหารที่มีส่วนประกอบของแป้งและน้ำตาลในปริมาณมาก ที่สำคัญผู้ป่วยควรทำจิตใจให้เบิกบานควบคู่ไปกับการปฏิบัติตามคำแนะนำของแพทย์อย่างเคร่งครัด\n\tที่มา สำนักงานกองทุนสนับสนุนการสร้างเสริมสุขภาพ (สสส.)","\tในระยะนี้เอง อาจใช้พืชสมุนไพรช่วยมีหลายชนิดให้เลือกกินเป็นอาหารได้ หมุนเวียนสลับกันไป โดยเฉพาะอย่างยิ่ง พืชเถาจำพวก ฟักเขียว ฟักทอง บวบ น้ำเต้านำมาต้มหรือนึ่ง กินกับน้ำพริกที่ชอบ\ntเมื่อเร็วๆ นี้ มีงานวิจัยชิ้นหนึ่ง รายงานผลการศึกษาฤทธิ์รักษาเบาหวานในสัตว์ทดลองของพืชชนิดหนึ่ง คนไทยเรียกชื่อว่าโสมไทย ซึ่งไม่เกี่ยวข้องอันใดกับโสมจีนหรือโสมเกาหลี เพียงแต่มีรากสะสมอาหารที่ดูคล้ายๆ รากโสม พืชที่เรียกโสมไทยนี้ ดั้งเดิมจริงๆ ก็ไม่ใช่ไม้พื้นบ้านของไทย เพียงแต่มีคนนำมาปลูกเมื่อหลายสิบปีก่อน ด้วยคุณสมบัติที่ทนร้อน ทนแล้ง ทนโรค ขยายพันธุ์ง่าย กินเป็นผักได้ ถึงวันนี้ พบได้ทั่วไป ทั้งที่มีคนปลูกและขึ้นเอง\ntโสมไทยเป็นพืชล้มลุก อวบน้ำ โตเต็มที่สูงได้ถึงหัวเข่า ใบเดี่ยวรูปไข่กลับเรียวยาวราว 1 นิ้วมือ โคนใบแหลม ปลายใบป้าน มีหยักเว้าเข้าหาเส้นกลางเล็กน้อย ทั้งก้านและใบมีน้ำเป็นส่วนใหญ่ หักดูเห็นเป็นเมือกลื่น ดอกขนาดเล็กสีม่วงมี 5 กลีบ รวมอยู่ในเป็นช่อที่มีก้านยาว ผลสีแดง กลมรี มีขนาดเล็ก มีเมล็ดจำนวนมากปลูกโดยใช้เมล็ดหรือปักชำก็ได้\n\tโสมไทย อุดมไปด้วยวิตามินเอและซี ธาตุเหล็กและแคลเซียม รายงานวิจัยชี้ว่า สารสกัดจากโสมไทยมีฤทธิ์ต้านอนุมูลอิสระ ป้องกันตับอักเสบ และที่น่าสนใจมากคือ ลดระดับน้ำตาลในเลือดของหนูที่เป็นเบาหวาน และปรับระดับไขมันในเลือด คล้ายกับยารักษาเบาหวานที่ชื่อเมทฟอร์มินอีกด้วย\n\tที่มา สำนักงานกองทุนสนับสนุนการสร้างเสริมสุขภาพ (สสส.)"]
    
    var type = 0;
    var list = ""
    var imagename = ["1.jpg","3.jpg","4.jpg","5.jpg"]

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        list = news[type]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Image", for: indexPath) as! KnowledgeCell
        //cell.View.backgroundColor = UIColor.white
        cell.TextView.text = list
        cell.TextView.isEditable = false
        cell.TextView.isScrollEnabled = false
        cell.K2.image = UIImage(named: imagename[type])
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(list.characters.count) 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
