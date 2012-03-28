# coding:utf-8
require 'spec_helper'
require_relative '../../lib/html2markdown'

describe HTMLPage do

  it "should fetch contents of url" do
    url = 'http://www.kickstarter.com/projects/1397300529/railsapp'
    VCR.use_cassette 'html_page' do
      page = HTMLPage.new :url => url
      page.contents.should_not be_nil
      page.url.should == url
      page.markdown.length.should > 0
    end
  end

  it "can convert to markdow format" do
    contents = <<-CON
    \n<i class=\"pstatus\"> 本帖最后由 aria_lyy 于 2012-3-21 22:22 编辑 </i><br><br><strong>
    <font color=\"Navy\"><font size=\"4\"><font size=\"5\">看贴前请先看这儿——如果您不喜欢旅游，
    不喜欢自助旅游，不喜欢动点脑筋玩儿的舒坦点，不喜欢花点时间挑选旅行时自己可心儿的衣食住行景，
    您就赶紧把这个页面关了吧，不然实在浪费您的时间和国家那所剩无几的电资源</font></font></font></strong>
    <br><br><font color=\"Red\"><font size=\"5\">【前言】</font></font><br><br><strong>
    <font size=\"4\"><font color=\"Navy\">【关于去旅游和不去旅游的理由】<br>\r\n1.如果你喜欢旅游尤其自助游，却有各种“不能去旅游的理由”请跳转至2、3、4、5、6、7！
    <img src=\"images/smilies/default/lol.gif\" smilieid=\"12\" border=\"0\" alt=\"\"> 如果您没有那些讨厌的理由，请跳转至8！
    <img src=\"images/smilies/default/loveliness.gif\" smilieid=\"28\" border=\"0\" alt=\"\"><br>\r\n2.如果你认为是钱阻挡了旅游的步伐？LZ也是个工薪阶层，也是每年辛苦工作，攒出旅游的钱；再者说，哪怕只走个国内游，也算开了眼界、见了世面，钱，不是问题，更何况有许多人坚持穷游概念，钱就更不是问题；<br>\r\n3.如果你认为是假期阻挡了旅游的步伐？LZ和内口子每年也只有7天年假，却仍能挤一挤，腾出10天左右的时间去趟国外逍遥一番；再者说，哪怕只是4天的海岛游，也算晒出个富豪脸~别说工作放不下，那是你根本不想去旅游；<br>\r\n4.如果你认为是语言阻挡了旅游的步伐？LZ2006年第一次去意大利、2009年第二次走意大利、走希腊、走法国，2010年去南非、马来西亚，2011年马耳他、意大利、马来西亚，再到今年这趟西班牙，从来！从来从来！没因为二把刀（也就徘徊在国家英语三到四级的边缘）不成句的英语迷路、饿肚子、丢东西丢人、误火车飞机大炮、买不成东西，关键我们去的很多都是非英语国家，经常会出现我们用英语跟别人交流，别人用叽里呱啦的母语跟我们交谈，然后解决一件特别难的大事儿~~GOOD！东特哇瑞，别担心沟通有问题，那不是旅行的重点！<br>\r\n5.没伙伴？不旅行？哇塞，你一定是孤独症患者；<br>\r\n6.爹妈不让？不旅行？哇塞，还是去街心花园吧；<br>\r\n7.懒得查这个那个？你如果愿意点开这个帖子，就说明你根本不懒~</font></font></strong><br><strong><font size=\"5\"><font color=\"DarkRed\">8.那就揣着护照，动身吧！！！！！</font></font></strong>\n
    CON
    page = HTMLPage.new :contents => contents
    markdown = page.to_markdown page.contents
    markdown.length.should > 0
  end

  it "can accept custom parse" do
    contents = <<-CON
<table cellspacing="0" cellpadding="0"><tbody><tr><td class="t_msgfont" id="postmessage_4983254"><i class="pstatus"> 本帖最后由 theme_of_ryan 于 2011-12-29 22:21 编辑 </i><br>
<br>
<font size="4"><font face="微软雅黑 "><font size="3"><font face="微软雅黑 ">今年7月和几个<span href="tag.php?name=%E6%9C%8B%E5%8F%8B" onclick="tagshow(event)" class="t_tag">朋友</span>在吃饭漫无边际聊天的时候，突然提出今年12月去<span href="tag.php?name=%E6%B3%95%E5%9B%BD" onclick="tagshow(event)" class="t_tag">法国</span>和西班牙深度游的想法，当晚查询<span href="tag.php?name=%E6%9C%BA%E7%A5%A8" onclick="tagshow(event)" class="t_tag">机票</span>刚好遇到特价机票，毫不犹豫果断出票。去年我和男朋友自助游去过<span href="tag.php?name=%E6%84%8F%E5%A4%A7%E5%88%A9" onclick="tagshow(event)" class="t_tag">意大利</span>、克罗地亚和希腊22天（<strong><a href="http://bbs.go2eu.com/viewthread.php?tid=494274" target="_blank"><strong><font color="#0066cc">游记点这里</font></strong></a></strong>），所以做攻略的任务便落在了我身上。于是……我慢悠悠的开始准备阶段，现在接近完成阶段即开帖和大家分享当中的乐趣，把我最感兴趣、最关注的关键点写在帖子里，偶尔还需要和大家请教过程中遇到的问题。</font><font face="微软雅黑 "></font> <br>
<font face="微软雅黑 "><strong><font color="#ff00"></font></strong></font></font></font></font><br>
<font size="4"><font face="微软雅黑 "><font size="3"><font face="微软雅黑 "><strong><font color="#ff00">内容预告（呕心沥血的超级攻略放送ing）：</font></strong></font><br>
<font color="#ff00"><font face="微软雅黑 ">NOW！全程旅馆预订tips更新中<br>
NEXT！<br>
1、收集的参考资讯的连接tips<br>
2、全程涉及交通工具的预订方式（网站、班次和价格）<br>
</font></font><font color="#ff00"><font face="微软雅黑 ">3、全程目的地地图、游玩路线、标准景点介绍、独特景点推荐、餐厅推荐、Shopping推荐、最佳摄影点及注意事项</font></font></font></font></font><br>
<br>
<font face="微软雅黑 "><font size="3"><strong>DIY的手绘行程图</strong></font></font><br>
<span style="position: absolute; display: none" id="attach_1254048" onmouseover="showMenu({'ctrlid':this.id,'pos':'13'})"><img src="images/go2eu/attachimg.gif" border="0"></span>
<img src="http://att.qyer.com/day_111228/1112282241c0deb3a69dcd9cf5.jpg" file="http://att.qyer.com/day_111228/1112282241c0deb3a69dcd9cf5.jpg" width="700" class="zoom" onclick="zoom(this, this.src)" id="aimg_1254048" onmouseover="showMenu({'ctrlid':this.id,'pos':'12'})" alt="55105222201110032253301023057594630_006.jpg">
<div class="t_attach" id="aimg_1254048_menu" style="position: absolute; display: none">				
<a href="attachment.php?aid=MTI1NDA0OHxkYmZjODBmY3wxMzMyOTIzMTI4fGM0OTVjaUtKdjEveHl3OW1XSUFScll0MGtwWXFHRlNJUDV4S2ppbFMwU0p5TGNB&amp;nothumb=yes" title="55105222201110032253301023057594630_006.jpg" target="_blank"><strong>下载</strong></a> (247.14 KB)<br>
<div class="t_smallfont">2011-12-28 22:41</div>
</div>
<br>
<br>
<span style="position: absolute; display: none" id="attach_1254049" onmouseover="showMenu({'ctrlid':this.id,'pos':'13'})"><img src="images/go2eu/attachimg.gif" border="0"></span>
<img src="http://att.qyer.com/day_111228/1112282241a7c6f2711722bc9b.jpg" file="http://att.qyer.com/day_111228/1112282241a7c6f2711722bc9b.jpg" width="700" class="zoom" onclick="zoom(this, this.src)" id="aimg_1254049" onmouseover="showMenu({'ctrlid':this.id,'pos':'12'})" alt="55105222201110032253301023057594630_007.jpg">
<div class="t_attach" id="aimg_1254049_menu" style="position: absolute; z-index: 301; opacity: 1; left: 309px; top: 736px; display: none; ">				
<a href="attachment.php?aid=MTI1NDA0OXxhYTE5MTBiMHwxMzMyOTIzMTI4fGM0OTVjaUtKdjEveHl3OW1XSUFScll0MGtwWXFHRlNJUDV4S2ppbFMwU0p5TGNB&amp;nothumb=yes" title="55105222201110032253301023057594630_007.jpg" target="_blank"><strong>下载</strong></a> (241.74 KB)<br>
<div class="t_smallfont">2011-12-28 22:41</div>
</div>
<br>
<font face="微软雅黑 "><font size="3">我们一行四人，第二个是我，很可爱吧~</font></font><br>
<br>
[<i> 本帖最后由 theme_of_ryan 于 2011-10-16 00:31 编辑 </i>]</td></tr></tbody></table>
    CON
    page = HTMLPage.new :contents => contents
    page.img do |node,contents|
      if node['src'].end_with? 'gif'
        ''
      elsif node['src'].start_with? 'http'
        "![#{node['alt']}](#{node['src']} =300x)" 
      else
        "![#{node['alt']}](http://bbs.qyer.com/#{node['src']} =300x)" 
      end
    end
    markdown = page.to_markdown page.contents
    markdown.length.should > 0
  end

  it "should have markdown method" do
    p = HTMLPage.new :contents => '<strong>haha</strong>'
    p.markdown.should == '**haha**'
    p.contents = '<strong>hehe</strong>'
    p.markdown!.should == '**hehe**'
  end

  it "can have custom node parse block" do
    p = HTMLPage.new :contents => '<strong>haha</strong>'
    p.strong do |node,contents|
      "strong text : **#{contents}**"
    end
    p.markdown!.should be_include('strong text')
  end

end
